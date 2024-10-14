## Rules about model-related information

### Definitions:

# - the model is the model type (e.g. "k_means", etc)
# - the model's mode is the species of model such as "partition"
# - the engines are within a model and mode and describe the
#   method/implementation of the model in question. These are often R package
#   names.

### The package dependencies are model- and engine-specific.
### They are used across modes

### The `fit` information is a list of data that is needed to fit the model.
### This information is specific to an engine and mode.

### The `predict` information is also list of data that is needed to make some
### sort of prediction on the model object. The possible types are contained in
### `pred_types` and this information is specific to the engine, mode, and type
### (although there are no types across different modes).

# ------------------------------------------------------------------------------

# Initialize model environments

all_modes <- c("partition")

# ------------------------------------------------------------------------------

pred_types <- c("cluster", "raw")

# ------------------------------------------------------------------------------

modelenv <- new_environment()
modelenv$models <- NULL
modelenv$modes <- c(all_modes, "unknown")
