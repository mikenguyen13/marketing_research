# Keystroke dynamics for identity-fraud screening

Companion code for the book's keystroke-dynamics section (chapter 57, "Sensor, Biometric, and
Neurophysiological Data", `#sec-bio-keystroke`), which covers Kim, Valacich, Jenkins, Wilson,
Kumar and Weisgarber (2026), "Are You, You? Seamlessly Fighting Identity Fraud with Keystroke
Dynamics", *Information Systems Research* 37(3), 1854–1872, doi:10.1287/isre.2023.0088.

Kim et al.'s data and code are not public. The empirical work here therefore replicates the
closest open study, Monaro et al. (2018), "Covert lie detection using keyboard dynamics",
*Scientific Reports* 8:1976, whose authors posted their data and WEKA settings on
[GitHub](https://github.com/SPRITZ-Research-Group/Covert_lie_detection_using_keyboard_dynamics).

| File | What it is |
|---|---|
| `replicate_monaro2018.R` | Downloads Monaro et al.'s posted data and reproduces their Tables 2, 3, 5 and 7, then runs four extensions (content check vs timing, where the signal lives, a detector trained on genuine users only, and the step-up budget). |
| `keystroke-capture.js` | Browser capture for any web form. Records key-down/up times and key *class* (letter, digit, deletion, navigation, modifier, shortcut), never key identity, plus focus/blur times, paste and autofill events, and synthetic (scripted) events. |
| `keystroke_score.R` | Server-side scoring: session features, a reference calibrated on known-genuine sessions (per device class), one-sided robust z-scores with reason codes, a step-up budget policy, PSI drift and step-up parity monitors, and a JSON-in/JSON-out entry point. Base R plus `jsonlite`. |
| `tests/test_keystroke_score.R` | `testthat` suite for the scorer (21 expectations), on simulated sessions. |
| `demo.html` | A standalone page: type your own identity and an assigned one, compare the rhythms, and explore the fraud-versus-friction trade-off with the replication's ROC curves. Serve the folder over HTTP (e.g. `servr::httd()`), because some browsers block local scripts loaded from `file://`. |

## Run

```r
# Replication: needs readxl, RWeka and a Java runtime. About a minute.
Rscript replicate_monaro2018.R            # data go to tempdir(); pass a folder to keep them

# Scorer tests
Rscript -e 'testthat::test_dir("tests")'
```

## What reproduces

Every value in Monaro et al.'s Table 2 (Welch t-tests and Cohen's d) and Table 3 (error counts
by question type) reproduces exactly. Logistic regression, SMO and LMT reproduce exactly on
both held-out samples (the 20 lab participants and the 151 recruited online). RandomForest and
the 10-fold cross-validation accuracies differ by a few points, because RWeka ships WEKA 3.9.3
and the authors used 3.8/3.9, whose random streams differ.

## Production notes

* Score on the server. Anything computed in the browser can be edited by the person being scored.
* No enrolment exists for a first-time applicant, so compare each session with a reference of
  known-genuine applicants (cleared KYC, no chargebacks within the observation window), not with
  the applicant's own history.
* Treat missing keystrokes (autofill, password managers, paste, accessibility tools) as "no
  signal", never as risk.
* Typing speed varies with device, age, language and disability. Calibrate per device class, check
  `ks_parity()` before a threshold goes live, and keep a human-reviewable step-up path rather than
  automatic denial.
* Disclose behavioral capture in the privacy notice. Keystroke timing used to verify identity may
  count as biometric or special-category data in some jurisdictions; get a legal read for each
  market before deployment.
