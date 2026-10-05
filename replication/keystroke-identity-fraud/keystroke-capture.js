/*!
 * keystroke-capture.js — privacy-preserving keystroke-dynamics capture for web forms.
 *
 * Companion to the book's keystroke-dynamics section (ch. 57, sec-bio-keystroke). It records
 * WHEN keys go down and up in each form field and WHAT KIND of key it was (letter, digit,
 * deletion, navigation, modifier), never WHICH key. The payload therefore cannot be used to
 * reconstruct what a person typed; the field values travel through the form's normal submit,
 * exactly as they would without this script.
 *
 * Usage (browser):
 *   const cap = KeystrokeCapture.attach(document.querySelector('form'), {
 *     fields: ['first_name', 'last_name', 'dob', 'zip'],     // input names or ids, in form order
 *   });
 *   form.addEventListener('submit', () => {
 *     hiddenInput.value = JSON.stringify(cap.payload());       // events + features
 *   });
 *
 * Score on the server (keystroke_score.R), not in the browser: anything computed client-side
 * can be edited by the person being scored.
 */
(function (root) {
  'use strict';

  var now = (typeof performance !== 'undefined' && performance.now)
    ? function () { return performance.now(); } : function () { return Date.now(); };

  // Key class only. e.key is read to classify and immediately discarded.
  function keyClass(e) {
    var k = e.key;
    if (k === 'Backspace' || k === 'Delete') return 'del';
    if (k === 'Tab') return 'tab';
    if (k === 'Enter') return 'enter';
    if (k === 'Shift' || k === 'Control' || k === 'Alt' || k === 'Meta' || k === 'CapsLock') return 'mod';
    if (/^(Arrow|Home|End|Page)/.test(k)) return 'nav';
    if (e.ctrlKey || e.metaKey || e.altKey) return 'shortcut';      // Ctrl+A, Cmd+V, ...
    if (typeof k === 'string' && k.length === 1) return /[0-9]/.test(k) ? 'digit' : 'char';
    return 'other';
  }

  function median(a) {
    if (!a.length) return null;
    var s = a.slice().sort(function (x, y) { return x - y; }), m = s.length >> 1;
    return s.length % 2 ? s[m] : (s[m - 1] + s[m]) / 2;
  }
  function iqr(a) {
    if (a.length < 4) return null;
    var s = a.slice().sort(function (x, y) { return x - y; });
    var q = function (p) { var i = (s.length - 1) * p, lo = Math.floor(i), hi = Math.ceil(i);
      return s[lo] + (s[hi] - s[lo]) * (i - lo); };
    return q(0.75) - q(0.25);
  }
  function r1(x) { return x == null ? null : Math.round(x * 10) / 10; }

  function attach(form, opts) {
    opts = opts || {};
    var t0 = now();
    var names = opts.fields || Array.prototype.map.call(
      form.querySelectorAll('input[type=text],input[type=tel],input[type=email],input:not([type])'),
      function (el) { return el.name || el.id; });
    var els = names.map(function (n) {
      var el = form.querySelector('[name="' + n + '"]') || form.querySelector('#' + n);
      if (!el) throw new Error('keystroke-capture: no field named ' + n);
      return el;
    });

    var log = {};          // per-field event lists
    var focusLog = [];     // [{field, focus, blur}]
    var downAt = {};       // transient: e.code -> keydown time, to pair down/up. Never stored.
    var handlers = [];

    names.forEach(function (n, i) {
      var el = els[i];
      log[n] = { keys: [], pastes: 0, untyped_inputs: 0, synthetic: 0 };
      var typedSinceInput = false;
      var on = function (type, fn) { el.addEventListener(type, fn, true); handlers.push([el, type, fn]); };

      on('focus', function () { focusLog.push({ field: n, focus: now() - t0, blur: null }); });
      on('blur', function () {
        for (var j = focusLog.length - 1; j >= 0; j--)
          if (focusLog[j].field === n && focusLog[j].blur == null) { focusLog[j].blur = now() - t0; break; }
      });
      on('keydown', function (e) {
        if (!e.isTrusted) log[n].synthetic++;
        if (e.repeat) return;
        var t = now() - t0;
        downAt[e.code] = { t: t, i: log[n].keys.length };
        log[n].keys.push({ c: keyClass(e), d: r1(t), u: null });
        typedSinceInput = true;
      });
      on('keyup', function (e) {
        var p = downAt[e.code];
        if (p && log[n].keys[p.i]) log[n].keys[p.i].u = r1(now() - t0);
        delete downAt[e.code];
      });
      on('paste', function () { log[n].pastes++; });
      // A value change with no keystroke behind it: autofill, password manager, or a script.
      on('input', function () { if (!typedSinceInput) log[n].untyped_inputs++; typedSinceInput = false; });
    });

    function fieldFeatures(n) {
      var ev = log[n], keys = ev.keys;
      var content = keys.filter(function (k) { return k.c === 'char' || k.c === 'digit'; });
      var dd = [];   // key transition: keydown-to-keydown between consecutive content keys
      for (var i = 1; i < content.length; i++) dd.push(content[i].d - content[i - 1].d);
      var hold = content.filter(function (k) { return k.u != null; }).map(function (k) { return k.u - k.d; });
      var visits = focusLog.filter(function (f) { return f.field === n; });
      var firstKey = keys.length ? keys[0].d : null;
      // the visit in which typing started: latest focus at or before the first key
      var start = null;
      visits.forEach(function (f) { if (firstKey != null && f.focus <= firstKey) start = f; });
      return {
        visits: visits.length,
        latency_ms: (start && firstKey != null) ? r1(firstKey - start.focus) : null,   // focus -> first key
        dwell_ms: visits.reduce(function (s, f) { return s + ((f.blur || now() - t0) - f.focus); }, 0) | 0,
        n_content: content.length,
        n_deletions: keys.filter(function (k) { return k.c === 'del'; }).length,
        n_nav: keys.filter(function (k) { return k.c === 'nav'; }).length,
        median_dd_ms: r1(median(dd)),
        iqr_dd_ms: r1(iqr(dd)),
        max_dd_ms: dd.length ? r1(Math.max.apply(null, dd)) : null,       // longest hesitation
        median_hold_ms: r1(median(hold)),
        digits_share: content.length ? r1(content.filter(function (k) { return k.c === 'digit'; }).length / content.length) : null,
        pastes: ev.pastes,
        untyped_inputs: ev.untyped_inputs,
        synthetic_events: ev.synthetic
      };
    }

    function features() {
      var f = {};
      names.forEach(function (n) { f[n] = fieldFeatures(n); });
      // field transition: leaving one field -> first key in the next one, in visit order
      var trans = [];
      for (var i = 1; i < focusLog.length; i++) {
        var prev = focusLog[i - 1], cur = focusLog[i];
        var k = log[cur.field].keys.filter(function (e) { return e.d >= cur.focus; })[0];
        if (prev.blur != null && k) trans.push({ from: prev.field, to: cur.field, ms: r1(k.d - prev.blur) });
      }
      return {
        fields: f,
        field_transitions: trans,
        median_field_transition_ms: r1(median(trans.map(function (x) { return x.ms; }))),
        revisits: focusLog.length - names.filter(function (n) { return f[n].visits > 0; }).length,
        elapsed_ms: r1(now() - t0)
      };
    }

    return {
      features: features,
      // Raw timings by field (key class + down/up times) for server-side re-computation.
      events: function () { return JSON.parse(JSON.stringify({ fields: log, focus: focusLog })); },
      payload: function () {
        return { schema: 'keystroke-capture/1', ua_mobile: /Mobi|Android/i.test(navigator.userAgent),
                 events: this.events(), features: features() };
      },
      reset: function () {
        t0 = now(); focusLog = []; downAt = {};
        names.forEach(function (n) { log[n] = { keys: [], pastes: 0, untyped_inputs: 0, synthetic: 0 }; });
      },
      detach: function () { handlers.forEach(function (h) { h[0].removeEventListener(h[1], h[2], true); }); }
    };
  }

  var api = { attach: attach, _keyClass: keyClass, _median: median };
  if (typeof module !== 'undefined' && module.exports) module.exports = api;
  else root.KeystrokeCapture = api;
})(typeof window !== 'undefined' ? window : this);
