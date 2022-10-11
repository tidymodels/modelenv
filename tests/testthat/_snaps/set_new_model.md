# adding a new model

    Code
      set_new_model("sponge")
    Error <rlang_error>
      Model `sponge` already exists.

---

    Code
      set_new_model()
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

---

    Code
      set_new_model(2)
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

---

    Code
      set_new_model(letters[1:2])
    Error <rlang_error>
      Please supply a character string for a model name (e.g. `'k_means'`).

