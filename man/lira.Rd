\name{lira}
\alias{lira}
%- Also NEED an "\alias" for EACH other topic documented here.

\title{LInear Regression in Astronomy}

\description{
Performs Bayesian linear regression analysis optimized for astronomy. The method accounts for heteroscedastic and correlated errors in both the independent and the dependent variables, intrinsic scatters (in both variables), time evolution of normalization, slope and scatter, Malmquist and Eddington bias, and break of linearity ('knee'). The posterior distribution of the parameters is sampled with a JAGS (Just Another Gibbs Sampler) powered Gibbs sampler.
}
\usage{
lira(x, y,
delta.x, delta.y, covariance.xy,
y.threshold, delta.y.threshold, x.threshold, delta.x.threshold,
z, z.ref=0.01, time.factor="Ez", distance=c("luminosity","angular"),
Omega.M0=0.3, Omega.L0=0.7,
alpha.YIZ="dunif", beta.YIZ="dt", gamma.YIZ="dt", delta.YIZ=0.0,
sigma.YIZ.0="prec.dgamma", gamma.sigma.YIZ.Fz=0.0, gamma.sigma.YIZ.D=0.0,
alpha.XIZ=0.0, beta.XIZ=1.0, gamma.XIZ=0.0, delta.XIZ=0.0,
sigma.XIZ.0=0.0, gamma.sigma.XIZ.Fz=0.0, gamma.sigma.XIZ.D=0.0,
rho.XYIZ.0=0.0,  gamma.rho.XYIZ.Fz=0.0, gamma.rho.XYIZ.D=0.0,
n.mixture=1, pi="ddirch",
mu.Z.0="dunif", gamma.mu.Z.Fz="dt", gamma.mu.Z.D="dt",
sigma.Z.0="prec.dgamma", gamma.sigma.Z.Fz=0.0, gamma.sigma.Z.D=0.0,
mu.Z.0.mixture="dunif", sigma.Z.0.mixture="prec.dgamma",
Z.knee="dunif", l.knee=1e-04,
beta.YIZ.knee="beta.YIZ", delta.YIZ.knee="delta.YIZ", sigma.YIZ.0.knee = "sigma.YIZ.0",
mu.Z.min.0="-n.large", gamma.mu.Z.min.Fz="dt", gamma.mu.Z.min.D="dt",
sigma.Z.min.0=0.0, gamma.sigma.Z.min.Fz=0.0, gamma.sigma.Z.min.D=0.0,
Z.max= "n.large",
n.large=1e04,
inits, n.chains=1, n.adapt=1e03, quiet=TRUE,
n.iter=1e04, thin=1,
print.summary=TRUE, print.diagnostic=TRUE,
export=FALSE, export.mcmc="", export.jags="",
X.monitored=FALSE, export.X="",
XZ.monitored=FALSE, export.XZ="",
Z.monitored=FALSE, export.Z="",
Y.monitored=FALSE, export.Y="",
YZ.monitored=FALSE, export.YZ="")
}
%- maybe also "usage" for other objects documented here.
\arguments{
  \item{x}{the vector containing the observed values "x" of the independent variable.}
  \item{y}{the vector containing the observed values "y" of the dependent variable.}
  \item{delta.x}{optional vector containing the measurement 1-sigma uncertainties in "x".}
  \item{delta.y}{optional vector containing the measurement 1-sigma uncertainties in "y".}
  \item{covariance.xy}{optional vector containing the measurement uncertainties covariances.}
  \item{y.threshold}{optional vector containing the minimum observable values of "y". These threshold values are used to correct for the Malmquist bias.}
  \item{delta.y.threshold}{optional vector containing the 1-sigma uncertainties in "y.threshold".}
  \item{x.threshold}{optional vector containing the minimum observable values of "x". These threshold values are used to correct for the Malmquist bias.}
  \item{delta.x.threshold}{optional vector containing the 1-sigma uncertainties in "x.threshold".}
  \item{z}{optional vector containing the measured redshifts.}
  \item{z.ref}{reference redsfhit.}
  \item{time.factor}{character string indicating the form of the "Fz" time factor. "Fz" is renormalized such that Fz=1 at the reference redshift. If "Ez", the evolution is proportional to the Hubble factor; if "1+z", the evolution is proportional to (1+z).}
  \item{distance}{character string denoting the cosmological distances to use. If "luminosity" or "angular", angular diameter or luminosity distances are considered, respectively.}
  \item{Omega.M0}{present day matter density in units of the critical density in a LCDM universe. This is used to compute the distances and the time factor "Ez", if applicable.}
  \item{Omega.L0}{renormalized cosmological constant in units of the critical density. See "Omega.M0".}
  \item{alpha.YIZ}{a character string or a number giving the prior on the intercept of the Y-Z regression. By default, a uniform distribution is assumed. See Details.}
  \item{beta.YIZ}{a character string or a number giving the prior on the slope of the Y-Z relation. By default, a Student's t-distribution is assumed. See Details.}
  \item{gamma.YIZ}{a character string or a number giving the prior on slope of the time evolution of the Y-Z relation. If redshifts are provided, a default Student's t-distribution is assumed. Otherwise, the parameter is set to 0. See Details.}
  \item{delta.YIZ}{a character string or a number giving the prior on the slope tilt with time of the Y-Z relation. By default, this parameter is set to 0. See Details.}
  \item{sigma.YIZ.0}{a character string or a number giving the prior on the standard deviation of the intrinsic scatter of the Y-Z relation at "z.ref". By default, the precision, i.e., sigma.YIZ.0^-2, is assumed to follow a Gamma distribution. See Details.}
  \item{gamma.sigma.YIZ.Fz}{a character string or a number giving the prior on the evolution with "Fz" of the scatter sigma.YIZ. See Details. By default, this parameter is set to 0. See Details.}
  \item{gamma.sigma.YIZ.D}{a character string or a number giving the prior on the evolution with the distance "D" of  the scatter sigma.YIZ. By default, a delta prior is assumed and the parameter is set to 0. See Details.}
  \item{alpha.XIZ}{a character string or a number giving the prior on the intercept of the X-Z relation. By default, this parameter is set to 0. See Details.}
  \item{beta.XIZ}{a character string or a number giving the prior on the slope of the X-Z relation. By default, this parameter is fixed to 1. See Details.}
  \item{gamma.XIZ}{a character string or a number giving the prior on the slope of the time evolution of the X-Z relation. By default, this parameter is set to 0. See Details.}
  \item{delta.XIZ}{a character string or a number giving the prior on the slope tilt with time of the X-Z relation. By default, this parameter is set to 0. See Details.}
  \item{sigma.XIZ.0}{a character string or a number giving the prior on the standard deviation of the intrinsic scatter of the X-Z relation at "z.ref". By default, this parameter is set to 0. See Details.}
  \item{gamma.sigma.XIZ.Fz}{a character string or a number giving the prior on the evolution with "Fz" of the scatter sigma.XIZ. By default, this parameter is either set to 0. See Details.}
  \item{gamma.sigma.XIZ.D}{a character string or a number giving the prior on the evolution with the distance "D" of the scatter sigma.XIZ. By default, a delta prior is assumed and the parameter is set to 0. See Details.}
  \item{rho.XYIZ.0}{a character string or a number giving the prior on the correlation between the intrinsic scatters at "z.ref". By default, this parameter is set to 0. See Details.}
  \item{gamma.rho.XYIZ.Fz}{a character string or a number giving the prior on the evolution with "Fz" of the scatter-correlation rho.XYIZ. By default, this parameter is set to 0. See Details.}
  \item{gamma.rho.XYIZ.D}{a character string or a number giving the prior on the evolution with the distance "D" of the scatter-correlation rho.XYIZ. By default, a delta prior is assumed and the parameter is set to 0. See Details.}
  \item{n.mixture}{the number of Gaussian distributions in the mixture modeling the Z-distribution p(Z). See Details.}
  \item{pi}{the prior on the probability coefficients of the mixture components. By default a Dirichelet distribution is assumed. See Details.}
  \item{mu.Z.0}{a character string or a number giving the prior on the mean of the first mixture component at "z.ref". By default, a uniform distribution is assumed. See Details.}
  \item{gamma.mu.Z.Fz}{a character string or a number giving the prior on the evolution with "Fz" of the mean mu.Z. By default, a Student's t-distribution is assumed. See Details.}
  \item{gamma.mu.Z.D}{a character string or a number giving the prior on the evolution with the distance "D" of the mean mu.Z. By default, a Student's t-distribution is assumed. See Details.}
  \item{sigma.Z.0}{a character string or a number giving the prior on the dispersion of the first mixture component at "z.ref". By default, the precision follows a priori a Gamma distribution. See Details.}
  \item{gamma.sigma.Z.Fz}{a character string or a number giving the prior on the evolution with "Fz" of the dispersion sigma.Z. By default, this parameter is set to 0. See Details.}
  \item{gamma.sigma.Z.D}{a character string or a number giving the prior on the volution with the distance "D" of the dispersion sigma.Z. By default, a delta prior is assumed and the parameter is set to 0. See Details.}
   \item{mu.Z.0.mixture}{a character string or a number giving the prior on the mean of the additional mixture components at "z.ref". By default, a uniform distribution is assumed. See Details.}
  \item{sigma.Z.0.mixture}{a character string or a number giving the prior on the dispersion of the additional mixture components at "z.ref". By default, the precisions follow a priori a Gamma distribution. See Details.}
  \item{Z.knee}{a character string or a number giving the prior on the Z value where linearity breaks down. If applicable, the default prior is the uniform distribution. See Details.}
  \item{l.knee}{a character string or a number giving the prior on the width of the transition region where linearity breaks down. By default, a delta prior is assumed. See Details.}
  \item{beta.YIZ.knee}{a character string or a number giving the prior on the slope of the Y-Z relation before the break. If beta.YIZ.knee="beta.YIZ", no breaking occurs. See Details.}
  \item{delta.YIZ.knee}{a character string or a number giving the prior on the time evolution of the slope of the Y-Z relation before the break. If delta.YIZ.knee="delta.YIZ", the tilt does not change before the break. See Details.}
  \item{sigma.YIZ.0.knee}{a character string or a number giving the prior on the intercept of the Y-Z relation before the break. If sigma.YIZ.0.knee="sigma.0.YIZ", the intrinsic scatter does not change before the break. See Details.}
  \item{mu.Z.min.0}{minimum value of the Z distribution at "z.ref". The Gaussian ditribution of the covariate is trunceted below "mu.Z.Min.0". If "n.mixture">1, "mu.Z.Min.0" is automatically set to -n.large.}
  \item{gamma.mu.Z.min.Fz}{a character string or a number giving the prior on the evolution with "Fz" of mu.Z.min. By default, a Student's t-distribution is assumed. See Details.}
  \item{gamma.mu.Z.min.D}{a character string or a number giving the prior on the evolution with the distance "D" of the mean mu.Z.min. By default, a Student's t-distribution is assumed. See Details.}
  \item{sigma.Z.min.0}{a character string or a number giving the prior on the dispersion of the truncation "mu.Z.min.0" at "z.ref". By default, "sigma.Z.min.0" is set to 0.0 and the covariate distribution is sharply truncated. If "sigma.Z.min.0" is left free, the truncation is modeled with a complementary error function with dispersion "sigma.Z.min.0". See Details.}
  \item{gamma.sigma.Z.min.Fz}{a character string or a number giving the prior on the evolution with "Fz" of the dispersion sigma.Z.min. By default, this parameter is set to 0. See Details.}
  \item{gamma.sigma.Z.min.D}{a character string or a number giving the prior on the volution with the distance "D" of the dispersion sigma.Z.min. By default, a delta prior is assumed and the parameter is set to 0. See Details.}
  \item{Z.max}{maximum value of the Z distribution. The Gaussian ditribution and the prior on "mu.Z.0" are trunceted above Z.max. If "n.mixture">1, Z.max is automatically set to n.large.}
  \item{n.large}{large number used to define standard prior distributions. abs(x) have to be much smaller than n.large} 
  \item{inits}{optional specification of initial values in the form of a list or a function. See \code{\link[rjags]{jags.model}} for details.} 
  \item{n.chains}{the number of parallel chains for the model. See \code{\link[rjags]{jags.model}} for details.}
  \item{n.adapt}{the number of iterations for adaptation. See \code{\link[rjags]{jags.model}} for details.}
  \item{quiet}{logical value. If TRUE then messages generated during compilation will be suppressed. See \code{\link[rjags]{jags.model}} for details.}
  \item{n.iter}{number of iterations to monitor. See \code{\link[rjags]{coda.samples}} for details.}
  \item{thin}{thinning interval for monitors. See \code{\link[rjags]{coda.samples}} for details.}
  \item{print.summary}{logical value. If TRUE a summary of the chains properties is printed on the standard output.}
  \item{print.diagnostic}{logical value. If TRUE a diagnostic of the chains properties is printed on the standard output.}
  \item{export}{logical value. If TRUE two output files are written, one text file with the merged thinned chains and one text file with the JAGS script used to perform the regression.}
  \item{export.mcmc}{character string indicating the file name where to write the chains. If "" and export=TRUE, a file named "mcmc_all.dat" is created in the working directory.}
  \item{export.jags}{character string indicating the file name where to write the JAGS model. If "" and export=TRUE, a file named "lira.jags" is created in the working directory.}
  \item{X.monitored}{logical value. If TRUE the X varaibles are monitored.}
  \item{export.X}{character string indicating the file name where to write the chains for the X variables. If "", there is no export.}
  \item{XZ.monitored}{logical value. If TRUE the XZ varaibles are monitored.}
  \item{export.XZ}{character string indicating the file name where to write the chains for the XZ variables. If "", there is no export.}
  \item{Z.monitored}{logical value. If TRUE the Z varaibles are monitored.}
  \item{export.Z}{character string indicating the file name where to write the chains for the Z variables. If "", there is no export.}
  \item{Y.monitored}{logical value. If TRUE the Y varaibles are monitored.}
  \item{export.Y}{character string indicating the file name where to write the chains for the Y variables. If "", there is no export.}
  \item{YZ.monitored}{logical value. If TRUE the YZ varaibles are monitored.}
  \item{export.YZ}{character string indicating the file name where to write the chains for the YZ variables. If "", there is no export.}
}

\details{
The linear regression assumes:

Y = alpha.YIZ + beta.YIZ*Z + gamma.YIZ*T + delta.YIZ*T*Z +-sigma.YIZ,

where T=log10(Fz), alpha.YIZ is the intercept, beta.YIZ is the slope, gamma.YIZ is the time-evolution of the normalization, delta.YIZ is the time evolution of the slope, and sigma.YIZ is the time dependent dispersion of the normally-distributed intrinsic scatter. 'Fz' is the time factor. If the covariate variable "Z" cannot be mesured, we may consider X as a scattered proxy of Z,

X = alpha.XIZ + beta.XIZ*Z + gamma.XIZ*T + delta.XIZ*T*Z +-sigma.XIZ.

The input parameters x and y are the measured values of X and Y, respectively. The values delta.x and delta.x are the 1-sigma uncertainties,

x = X +- delta.x,

y = Y +- delta.y.

The measurement error covariances is covariance.xy.

The scatters sigma.YIZ and sigma.XIZ evolve with time as

sigma.YIZ = sigma.YIZ.0*(Fz^gamma.sigma.YIZ.Fz)*(D^gamma.sigma.YIZ.D),

sigma.XIZ = sigma.XIZ.0*(Fz^gamma.sigma.XIZ.Fz)*(D^gamma.sigma.XIZ.D),

where D is the normalized cosmological distance. The scatters sigma.YIZ and sigma.XIZ may be correlated, with correlation

rho.XYIZ = rho.XYIZ.0*(Fz^gamma.rho.XYIZ.Fz)*(D^gamma.rho.XYIZ.D).

The intrinsic distribution of Z is modelled as a mixture of normal distributions. The mean and the dispersion of the first component evolve as

mu.Z = mu.Z.0 + gamma.mu.Z.D*log10(D) + gamma.mu.Z.Fz*T,

sigma.Z = sigma.Z.0*(Fz^gamma.sigma.Z.Fz)*(D^gamma.sigma.Z.D).

When modeled as a single Gaussian, the distribution of the covariate can be truncated at low values with a complementary error function centered on

mu.Z.min = mu.Z.min.0 + gamma.mu.Z.min.D*log10(D) + gamma.mu.Z.min.Fz*T,

and with dispersion

sigma.Z.min = sigma.Z.min.0*(Fz^gamma.sigma.Z.min.Fz)*(D^gamma.sigma.Z.min.D).

At the high values end, the distribution can be truncated with an hard cut at Z.max.

Breaking of the linearity is allowed too. At Z.knee, the linear relation abruptly changes to

Y = alpha.YIZ.knee + beta.YIZ.knee*Z + gamma.YIZ.knee*T + delta.YIZ.knee*Z*T +-sigma.YIZ.0.knee.

The transiction function is

fknee= 1/(1+exp((Z-Zknee)/lknee),

where lknee is the transition length.

Priors on regression parameters can be expressed either as numbers or as character strings. If numbers, delta priors are adopted, the parameters are fixed to the input values, and they are fixed during the the regression. If strings, the prior distribution of the parameter is modeled after the argument. The syntax follows JAGS, see the JAGS user manual at \url{http://sourceforge.net/projects/mcmc-jags/files/Manuals/} for the complete list of distributions. The following shortcuts can be used: "dt" for the Student's" t-distribution "dt(0,1,1)", "dgamma" for the gamma distribution "dgamma(1.0/n.large,1.0/n.large)"; "dunif" for the uniform distribution "dunif(-n.large,n.large)". The distribution "prec.dgamma" is only applicable to dispersions and standard deviations. It means that the precision, i.e., the inverse of the variance, follows a "dgamma" distribution. "ddirch" is the Dirichlet distribution "ddirch(alpha)", with alpha=c(1,..,1).

If beta.YIZ.knee="beta.YIZ", no breaking occurs. Any prior on delta.YIZ.knee or sigma.YIZ.0.knee is superseded, and the conditions delta.YIZ.knee="delta.YIZ" and sigma.YIZ.knee="sigma.YIZ" are assumed.

If redshifts are not provided, all gamma and delta parameters are set to 0.
}
\value{
lira return a LIST
\item{first component}{A data frame containing the merged chains of all parameters.}
\item{second component}{An mcmc.list object containing the MCMC chains of the regression parameters.}
}
\references{
Sereno M., "A Bayesian approach to linear regression in astronomy" (2016), MNRAS 455, 2149-2162; arXiv:1509.05778. Electronic version at \url{http://adsabs.harvard.edu/abs/2016MNRAS.455.2149S}. Preprint also at \url{http://pico.bo.astro.it/~sereno/LIRA/}.
}
\author{
Mauro Sereno \email{mauro.sereno@unibo.it}
}

\note{The vectors x and y can contain missing values NA. The posterior distribution for the corresponding nodes, i.e. the statistical relations, is sampled. Missing values are best suited to the y vector. The samples at the NA locations in the response vector are samples from the posterior predictive distribution and can be summarized just like other model parameters. They can be used to forecast the missing data.}

\section{Warning}{The dependence packages do not include a copy of the JAGS library, which must be installed separately. For instructions on downloading JAGS, see \url{http://mcmc-jags.sourceforge.net}. C++ compilers are also needed.}

\seealso{
See also \code{\link{distance.LCDM}}, \code{\link{Hubble.LCDM}}, \code{\link[rjags]{jags.model}}, \code{\link[rjags]{coda.samples}}.
}
\examples{
## EXAMPLE 1
## sample
n.sample <- 20
# intrinsic p(Z) distribution of the independet variable
mu.Z.0 <- 0.0; sigma.Z.0 <- 1.0;
Z <- rnorm(n.sample, mean = mu.Z.0, sd = sigma.Z.0)
# X is unscattered
X <- Z
# observational uncertainties in X
delta.x <- rnorm(n.sample, sd = 0.04)
x <- X + delta.x
# scaling relation Y-Z
alpha.YIZ <- 0.0; beta.YIZ <- 1.0; sigma.YIZ.0 <- 0.1;
# dependent variable
Y <- alpha.YIZ + beta.YIZ*Z + rnorm(n.sample, sd = sigma.YIZ.0)
# observational uncertainties in Y
delta.y <- rnorm(n.sample, sd = 0.05)
y <- Y + delta.y
data.all <- data.frame(x=x, y=y, delta.x=delta.x, delta.y=delta.y)
# regression
samples <- lira(x, y, delta.x=delta.x, delta.y=delta.y, n.adapt=100,
n.iter=1000)

## EXAMPLE 2
## Malmquist bias, only objects with y > y.threshold are selected
y.th <- -0.5
data.sel <- data.all[which(data.all$y>y.th),]
n.sel <- nrow(data.sel)
# regression
samples.MB <- lira(data.sel$x, data.sel$y, data.sel$delta.x, data.sel$delta.y, 
y.threshold = rep(y.th,n.sel), n.adapt=100,
n.iter=1000, print.summary=FALSE)

## Further examples can be found at http://pico.bo.astro.it/~sereno/LIRA/.
}
% Add one or more standard keywords, see file "KEYWORDS" in the
% R documentation directory.
\keyword{regression}
\keyword{models}% __ONLY ONE__ keyword per line
\keyword{multivariate}

