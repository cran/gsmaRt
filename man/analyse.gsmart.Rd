\name{analyse.gsmart}
\alias{analyse.gsmart}
\title{
Main Function of the gsmart package.
}
\description{
Allows for mutliple gene set testing despite inter-gene and inter-gene set correlations as proposed in Tian et al.

}
\usage{
analyse.gsmart(X, response, gs.list, nrot = 1000, tests = c("W", "G"), one.sided = FALSE, verbose = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
Expression matrix X
%%     ~~Describe \code{X} here~~
}
  \item{response}{
Response Vector
%%     ~~Describe \code{response} here~~
}
  \item{gs.list}{
Data frame or matrix of gene sets. Genes in first, gene sets in second column.
%%     ~~Describe \code{gs.list} here~~
}
  \item{nrot}{
Number of rotations applied.
%%     ~~Describe \code{nrot} here~~
}
  \item{tests}{
Which tests shall be applied? Currently, Wilcoxon ("W") or Goeman ("G") can be chosen. Put "all" if you want all tests to be performed.
%%     ~~Describe \code{tests} here~~
}
  \item{one.sided}{
logical, optional. Shall one-sided p-values be returned as well? Only available for Wilcoxon.
%%     ~~Describe \code{one.sided} here~~
}
  \item{verbose}{
Extra output.
%%     ~~Describe \code{verbose} here~~
}
}

\value{
result list
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Mathias Fuchs and Stephan Artmann, in preparation

Lu Tian, Steven A. Greenberg, Sek Won Kong, Josiah Altschuler, Isaac S. Kohane, and Peter J. Park Discovering statistically significant pathways in expression profiling studies

%% ~put references to the literature/web site here ~
}
\author{
Stephan Artmann,
Mathias Fuchs
%%  ~~who you are~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


%% ~~objects to See Also as \code{\link{help}}, ~~~

\examples{
#######################################
### Generate random expression data ###
#######################################
# Generate random mRNA expression data with 20 mRNAs
# and 10 replicates
Y = rnorm(200);
dim(Y) = c(20,10);
rownames(Y) = 1:20;

# Lets assume that the corresponding mRNA experiments had the following design:
groups = (c(1,1,1,1,1,2,2,2,2,2));

####################
### Perform Test ###
####################
library(gsmaRt)
#Let gene set 1 contain mRNAs 1 to 9 and gene set 2 contain mRNAs 10 to 17.
# Genes 18 to 20 are not contained anywhere. Gene set 3 is empty.
miR = c(rep(1,9),c(rep(2,8)));
mRNAs = 1:17;
A = data.frame(mRNAs,miR); # Note that the gene sets MUST be in the second column!
A

set.seed(1)
P = analyse.gsmart(Y,groups,A)
P

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
