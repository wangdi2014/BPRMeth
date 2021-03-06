% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/infer_profiles_gibbs.R
\name{infer_profiles_gibbs}
\alias{infer_profiles_gibbs}
\alias{infer_profile_gibbs}
\alias{inference_gibbs}
\alias{infer_profiles_gibbs}
\title{Infer methylation profiles using Gibbs sampling}
\usage{
infer_profiles_gibbs(X, model = NULL, basis = NULL, H = NULL, w = NULL,
  mu_0 = NULL, cov_0 = NULL, gibbs_nsim = 500, gibbs_burn_in = 100,
  store_gibbs_draws = FALSE, is_parallel = FALSE, no_cores = NULL, ...)
}
\arguments{
\item{X}{The input data, either a \code{\link[base]{matrix}} or a
\code{\link[base]{list}} of elements of length N, where each element is an
\code{L X C} matrix, where L are the total number of observations. The
first column contains the input observations x (i.e. CpG locations). If
"binomial" model then C=3, and 2nd and 3rd columns contain total number of
trials and number of successes respectively. If "bernoulli" then C=2
containing the output y (e.g. methylation level).}

\item{model}{Observation model name as character string. It can be either
'bernoulli' or 'binomial'.}

\item{basis}{A 'basis' object. E.g. see \code{\link{create_basis}}. If NULL,
will an RBF object will be created.}

\item{H}{Optional, design matrix of the input data X. If NULL, H will be
computed inside the function.}

\item{w}{A vector of initial parameters (i.e. coefficients of the basis
functions). If NULL, it will be initialized inside the function.}

\item{mu_0}{The prior mean hyperparameter vector for w.}

\item{cov_0}{The prior covariance hyperparameter matrix for w.}

\item{gibbs_nsim}{Total number of simulations for the Gibbs sampler.}

\item{gibbs_burn_in}{Burn in period of the Gibbs sampler.}

\item{store_gibbs_draws}{Logical indicating if we should keep the whole MCMC
chain for further analysis.}

\item{is_parallel}{Logical, indicating if code should be run in parallel.}

\item{no_cores}{Number of cores to be used, default is max_no_cores - 1.}

\item{...}{Additional parameters.}
}
\value{
An object of class \code{infer_profiles_gibbs_}"obs_model" with the
  following elements: \itemize{ \item{ \code{W}: An Nx(M+1) matrix with the
  posterior mean of the parameters w. Each row of the matrix corresponds to
  each element of the list X; if X is a matrix, then N = 1. The columns are
  of the same length as the parameter vector w (i.e. number of basis
  functions). } \item{ \code{W_sd}: An Nx(M+1) matrix with the posterior
  standard deviation (sd) of the parameters W.} \item{ \code{basis}: The
  basis object. } \item{\code{nll_feat}: NLL fit feature.}
  \item{\code{rmse_feat}: RMSE fit feature.} \item{\code{coverage_feat}: CpG
  coverage feature.} \item{\code{W_draws}: Optional, draws of the Gibbs
  sampler. } }
}
\description{
General purpose functions for inferring latent profiles for
  different observation models using Gibbs sampling. Currently implemented
  observation models are: 'bernoulli' and 'binomial' and the auxiliary
  variable approach is used.
}
\section{Details}{
 The modelling and mathematical details for inferring
  profiles using Gibbs sampling are explained here:
  \url{http://rpubs.com/cakapourani/} . More specifically: \itemize{\item{For
  Binomial observation model check:
  \url{http://rpubs.com/cakapourani/bayesian-bpr-model}} \item{For Bernoulli
  observation model check:
  \url{http://rpubs.com/cakapourani/bayesian-bpr-model}}}
}

\examples{
# Example of inferring parameters for synthetic data using 3 RBFs
basis <- create_rbf_object(M=3)
out <- infer_profiles_gibbs(X = binomial_data, model = "binomial",
   basis = basis, is_parallel = FALSE, gibbs_nsim = 10, gibbs_burn_in = 5)

#-------------------------------------

}
\seealso{
\code{\link{create_basis}}, \code{\link{infer_profiles_mle}},
  \code{\link{infer_profiles_vb}}, \code{\link{create_region_object}}
}
\author{
C.A.Kapourani \email{C.A.Kapourani@ed.ac.uk}
}
