# lira
R-package for Bayesian linear regression in astronomy. The method accounts for heteroscedastic errors in both the independent and the dependent variables, intrinsic scatters (in both variables), time evolution of slopes, normalization and scatters, Malmquist and Eddington bias, and break of linearity. The posterior distribution of the regression parameters  is sampled with a Gibbs method exploiting the JAGS (Just Another Gibbs sampler) library.

The JAGS library has to be installed separately. It can be downloaded from http://mcmc-jags.sourceforge.net.
