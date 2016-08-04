---
title: Course outline

---

- *Start time:* 8am
- *End time:* 5pm

2x 4 hour blocks:

- Morning: 8am-12pm
- Aternoon: 1pm-5pm


# Morning

## Intro (Dave M)

- GLM refresher
  - model the *mean*
  - here are some distributions (plot + mean-variance)
- GLMs -> GAMs
- Spline
  - why are they good?
  - how do they work?
  - measuring wigglyness
- What is uncertainty?
* "Hook" for "model expansion"


### Practical

- `gam()`
- `s()`
- `gam.check()`
- `summary()`
- `plot()`
* `predict()`


## Model checking (Eric)

*(1/2 slot?)*

- `gam.check()`
- `concurvity()`
- (randomised quantile residuals)
* autocorrelation (check?)

### Practical

- `gam.check()`

## Model selection (Gavin)

*(1/2 slot?)*

- shrinkage via shrinkage smooths
- shrinkage via select = TRUE
- AIC corrected for estimated smoothness params
- approximate *p* values (mention at least)

### Practical

- `summary()`

## Beyond the exponential family (all)

*(1/2 slot?)*

- Count data: Tweedie, negative binomial & ZIP (Dave)
- Beta regression (Gavin)
- Other stuff: t, `cox.ph`, ordered categorical, mvnorm (Eric)

# Afternoon

## Extended examples/demos (all)

Introduce a set of examples, let people pick what they want. Workbook-type situation.

- Spatial modelling
  - Dolphins (Dave) (Example)
- Spatio-temporal models
  - Trawl data from ERDDAP (Eric) (Example)
  - Lake cores (Gavin) (Demo)
- Time series modelling
  - `lynx` (Eric) (Example)
  - Ft Lauderdale (Eric) (Example)
  - Ft Lauderdale `ti()` (Gavin) (Example)
- Markov random fields
  - forest health data (Gavin) (Example)
- `"lpmatrix"`
  - dolphins revisit (Dave) (Example)
- random effects
  - cheetahs (Gavin)
  - ship effect trawl (Eric)
- Location-scale models?
  - Quick example (Gavin) (Demo)
- Linear functionals
  - dispersal kernels black spruce (Eric) (Example)


## Smoother zoo checklist

- [ ] 2-D smoother `s()` (Dave intro example)
- [ ] `te()`
- [ ] soap film (Dave spatial dolphins)
- [ ] `"ts"` (Gavin model selection)
- [ ] Cyclic splines
- [ ] `fs` basis/`by=`
- [ ] random effects
- [ ] Gaussian process smoothers?
- [ ] multiple formulae specification?



