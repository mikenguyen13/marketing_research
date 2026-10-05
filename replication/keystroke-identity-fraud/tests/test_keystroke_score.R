# Run from the keystroke-identity-fraud folder:  Rscript -e 'testthat::test_dir("tests")'
library(testthat)
src <- if (file.exists("keystroke_score.R")) "keystroke_score.R" else "../keystroke_score.R"
source(src)

# A payload shaped like keystroke-capture.js output. `slow` scales every timing, as when a
# person types an identity that is not theirs. The timing parameters are illustrative only.
fake_payload <- function(slow = 1, mobile = FALSE, keys = c(5, 7, 8, 5), untyped = 0, synthetic = 0) {
  f <- function(n, digits, base) list(
    visits = 1, latency_ms = 600 * slow * exp(rnorm(1, 0, .3)), n_content = n,
    n_deletions = rbinom(1, n, .03 * slow), median_dd_ms = base * slow * exp(rnorm(1, 0, .2)),
    max_dd_ms = 3 * base * slow * exp(rnorm(1, 0, .3)), digits_share = digits,
    pastes = 0, untyped_inputs = untyped, synthetic_events = synthetic)
  list(ua_mobile = mobile, features = list(
    fields = list(first_name = f(keys[1], 0, 140), last_name = f(keys[2], 0, 140),
                  dob = f(keys[3], 1, 190), zip = f(keys[4], 1, 190)),
    median_field_transition_ms = 450 * slow * exp(rnorm(1, 0, .3))))
}
sessions <- function(n, ...) do.call(rbind, lapply(seq_len(n), function(i) ks_features(fake_payload(...))))

set.seed(1)
good <- rbind(sessions(300), sessions(250, mobile = TRUE))
ref  <- ks_calibrate(good)

test_that("features are extracted with the right types", {
  x <- ks_features(fake_payload())
  expect_equal(nrow(x), 1)
  expect_true(all(c("latency", "key_alpha", "key_num", "deletion_rate") %in% names(x)))
  expect_equal(x$n_keys, 25)
  expect_false(x$no_signal)
})

test_that("a reference is built per device class", {
  expect_s3_class(ref, "ks_reference")
  expect_setequal(names(ref$ref), c("desktop", "mobile"))
  expect_equal(unname(ref$n["desktop"]), 300)
})

test_that("slower, hesitant sessions score higher than genuine ones", {
  g <- ks_score(sessions(200), ref)$score
  b <- ks_score(sessions(200, slow = 2), ref)$score
  auc <- mean(outer(b, g, ">")) + 0.5 * mean(outer(b, g, "=="))
  expect_gt(auc, 0.9)
})

test_that("autofill or paste-only sessions are no_signal, never flagged as risky", {
  x <- ks_features(fake_payload(keys = c(0, 0, 0, 0), untyped = 1))
  s <- ks_score(x, ref)
  expect_true(s$no_signal)
  expect_equal(ks_decide(s, threshold = 0), "no_signal")
})

test_that("synthetic (scripted) key events route to automation review", {
  s <- ks_score(ks_features(fake_payload(synthetic = 3)), ref)
  expect_equal(ks_decide(s, threshold = 99), "step_up_automation")
})

test_that("the threshold steps up about the budgeted share", {
  s <- ks_score(sessions(1000), ref)
  th <- ks_threshold(s$score, budget = 0.10)
  expect_equal(mean(ks_decide(s, th) == "step_up"), 0.10, tolerance = 0.01)
})

test_that("PSI is near zero for the same population and large after a shift", {
  a <- ks_score(sessions(500), ref)$score
  b <- ks_score(sessions(500), ref)$score
  c <- ks_score(sessions(500, slow = 1.5), ref)$score
  expect_lt(ks_psi(a, b), 0.1)
  expect_gt(ks_psi(a, c), 0.25)
})

test_that("pooling devices flags mobile users disproportionately; per-device references do not", {
  mob <- sessions(400, mobile = TRUE, slow = 1.3)       # phones type slower, honestly
  desk <- sessions(400)
  calib <- rbind(sessions(300), sessions(300, mobile = TRUE, slow = 1.3))
  for (by in c(FALSE, TRUE)) {
    r <- ks_calibrate(calib, by_device = by)
    s <- ks_score(rbind(desk, mob), r)
    d <- ks_decide(s, ks_threshold(s$score, 0.10))
    p <- ks_parity(d, s$device)
    if (by) expect_true(all(!p$review)) else expect_true(p$review[p$segment == "mobile"])
  }
})

test_that("JSON in, JSON out", {
  out <- jsonlite::fromJSON(ks_score_json(jsonlite::toJSON(fake_payload(slow = 3), auto_unbox = TRUE),
                                          ref, threshold = 0.5))
  expect_true(out$decision %in% c("step_up", "allow"))
  expect_true(is.numeric(out$score))
  expect_equal(out$device, "desktop")
})

test_that("weights can be refit from labelled outcomes", {
  x <- rbind(sessions(300), sessions(60, slow = 2))
  w <- ks_fit_weights(x, ref, y = rep(0:1, c(300, 60)))
  expect_equal(sum(w), 1)
  expect_true(all(w >= 0))
})
