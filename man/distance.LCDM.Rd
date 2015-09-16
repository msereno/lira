\name{distance.LCDM}
\alias{distance.LCDM}

\title{Angular diameter distance in a LCDM universe}

\description{
Angular diameter distance in a LCDM (Cold Dark Matter universe with a cosmological constant) universe between an observer at 'zd' and a source at 'zs'. The distance is in units of the Hubble distance c/H0, where 'c' is the speed of light and 'H0' is the Hubble constant.
}
\usage{
distance.LCDM(zo=0.0,z,Omega.M0=0.3,Omega.L0=0.7)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{zo}{redshift of the observer.}
  \item{z}{redshift of the source.}
  \item{Omega.M0}{present day matter density in units of the critical density.}
  \item{Omega.L0}{renormalized cosmological constant in units of the critical density.}
 }
%\details{...}
\value{
The estimate of the distance.
}
\references{
Sereno M., Covone G., Piedipalumbo E., de Ritis R., (2001) Monthly Notices of the Royal Astronomical Society 327, 517-530.
}
\author{
Mauro Sereno \email{mauro.sereno@unibo.it}
}
%\note{ ~~further notes~~}
 
\seealso{See also \code{\link{Hubble.LCDM}}.}
\examples{
# Distance to a source at z=1 in a standard cosmology,
distance.LCDM(z=1.0) 
# Distance between a lens at zl=0.3 and a source at z=1 in an open cosmology,
distance.LCDM(0.3,1,Omega.M0=0.2,Omega.L0=0.7)
}
\keyword{cosmology}

