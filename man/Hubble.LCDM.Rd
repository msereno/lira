\name{Hubble.LCDM}
\alias{Hubble.LCDM}

\title{Hubble parameter}

\description{
Hubble parameter in a LCDM (Cold Dark Matter universe with a cosmological constant) universe in units of the present day Hubble constant.
}
\usage{
Hubble.LCDM(z,Omega.M0=0.3,Omega.L0=0.7)
}

\arguments{
  \item{z}{the redshift}
  \item{Omega.M0}{present day matter density in units of the critical density in a LCDM universe.}
  \item{Omega.L0}{renormalized cosmological constant in units of the critical density. See 'Omega.M0'.} 
}
\value{
The Hubble parameter in units of H0. 
}
\references{
Sereno M., Covone G., Piedipalumbo E., de Ritis R., (2001) Monthly Notices of the Royal Astronomical Society 327, 517-530.
}
\author{
Mauro Sereno \email{mauro.sereno@unibo.it}
}

\seealso{See also \code{\link{Hubble.LCDM}}.}
\examples{
# Hubbel parameter at redshit z=1 in a standard cosmology,
Hubble.LCDM(1) 
# Hubbel parameter at redshit z=1 in an open cosmology,
Hubble.LCDM(1,Omega.M0=0.2,Omega.L0=0.7)
}

\keyword{cosmology}

