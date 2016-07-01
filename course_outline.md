

*Start time:* 8am
*End time:* 5pm

2x 4 hour blocks:

- 8am-12pm
- 1pm-5pm


# Notes

- May not be wifi
  - bring spare router?
- Script to run along with the workshop
- Software Carpentry-esque
* Template for analysis -- workflow

# Data

- `lynx`
- breeding bird survey?
  - time series per site (univariate, bells and whistles)
  - spatial snapshot (spatial, bivariate)



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
* Big list o' distributions (examples)


## Extended examples/demos (all)

Introduce a set of examples, let people pick what they want. Workbook-type situation.

- Spatial modelling (Example)
  - Fisheries -- effectively quadrats (Dave/Eric)
- Time series modelling (Example)
  - `lynx` (non-linear autoregressive)
  - central England temperature series -- tensor (Gavin)
  - Gaussian data?
- Spatio-temporal models
  - Demo? (Computational time)
  - Kodiak whale data? Blue ling? Whiting? (Dave)
  - Lake cores (Gavin)
- Location-scale models (Demo)
  - Quick example (Gavin)
- Markov random fields (Demo)
  * forest health data (Fahrmir)
  - model lakes connected by streams?
- `"lpmatrix"` (Dave/Gavin)
  - show the multiple possible realisations earlier on but explain them here
  - uncertainty about some summary (sum, derivatives etc)
  - generation of betas from the normal distn etc
- random effects (Dave) (quick)
  - `"re"`
  - `paraPen`


## Smoother zoo

* 2-D smoothers `s()` and `te()`
  - soap film
  - `"ts"`
* Cyclic splines
* `fs` basis/`by=`
* random effects
- Gaussian process smoothers?


