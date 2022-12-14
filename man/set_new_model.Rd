% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set_new_model.R
\name{set_new_model}
\alias{set_new_model}
\title{Register New Model}
\usage{
set_new_model(model)
}
\arguments{
\item{model}{A single character string for the model type (e.g. "k_means",
etc).}
}
\value{
NULL invisibly
}
\description{
This function is used to register new types of models.
}
\details{
This function is available for users to add their own models or
engines (in a package or otherwise) so that they can be accessed using
packages that use modelenv.
}
\examples{
\dontshow{if (FALSE) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
set_new_model("shallow_learning_model")
\dontshow{\}) # examplesIf}
}
