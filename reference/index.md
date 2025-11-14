# Package index

## Register Models

These functions are used together to register all the different types of
information that is needed for them to be used in their respective
tidymodels packages.

- [`set_new_model()`](https://modelenv.tidymodels.org/reference/set_new_model.md)
  : Register New Model
- [`set_model_mode()`](https://modelenv.tidymodels.org/reference/set_model_mode.md)
  : Register Mode for Model
- [`set_model_engine()`](https://modelenv.tidymodels.org/reference/set_model_engine.md)
  : Register Engine for Model
- [`set_dependency()`](https://modelenv.tidymodels.org/reference/set_dependency.md)
  [`get_dependency()`](https://modelenv.tidymodels.org/reference/set_dependency.md)
  : Register Dependency for Model
- [`set_model_arg()`](https://modelenv.tidymodels.org/reference/set_model_arg.md)
  [`get_model_arg()`](https://modelenv.tidymodels.org/reference/set_model_arg.md)
  : Register Argument for Model
- [`set_fit()`](https://modelenv.tidymodels.org/reference/set_fit.md)
  [`get_fit()`](https://modelenv.tidymodels.org/reference/set_fit.md) :
  Register Fit method for Model
- [`set_encoding()`](https://modelenv.tidymodels.org/reference/set_encoding.md)
  [`get_encoding()`](https://modelenv.tidymodels.org/reference/set_encoding.md)
  : Register Encoding Options for Model
- [`set_pred()`](https://modelenv.tidymodels.org/reference/set_pred.md)
  [`get_pred_type()`](https://modelenv.tidymodels.org/reference/set_pred.md)
  : Register Prediction Method for Model

## Developer Functions

This set of functions can be useful inside modeling infrastructure to
perform checking that the models, modes, and engines align.

- [`stop_incompatible_mode()`](https://modelenv.tidymodels.org/reference/stop_incompatible_mode.md)
  : Error handling for incompatible modes
- [`check_spec_mode_engine_val()`](https://modelenv.tidymodels.org/reference/check_spec_mode_engine_val.md)
  : Error handling for unknown mode
- [`new_unsupervised_spec()`](https://modelenv.tidymodels.org/reference/new_unsupervised_spec.md)
  : Give object unsupervised specification class
- [`is_unsupervised_spec()`](https://modelenv.tidymodels.org/reference/is_unsupervised_spec.md)
  : Determine object is has class unsupervised_spec
- [`new_unsupervised_fit()`](https://modelenv.tidymodels.org/reference/new_unsupervised_fit.md)
  : Give object unsupervised fit class
- [`is_unsupervised_fit()`](https://modelenv.tidymodels.org/reference/is_unsupervised_fit.md)
  : Determine object is has class unsupervised_fit

## Model Environment

modelenv provides an environment which is used to store the registered
models. These functions is how to access the underlying environment.

- [`get_model_env()`](https://modelenv.tidymodels.org/reference/get_model_env.md)
  [`get_from_env()`](https://modelenv.tidymodels.org/reference/get_model_env.md)
  [`set_env_val()`](https://modelenv.tidymodels.org/reference/get_model_env.md)
  : Working with the modelenv model environment
