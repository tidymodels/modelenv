# check_spec_mode_engine_val() works

    Code
      check_spec_mode_engine_val("hoop", "raw", "stats")
    Error <rlang_error>
      Available modes for engine stats are: 'unknown', 'partition'

# stop_incompatible_mode() works

    Code
      stop_incompatible_mode(spec_modes = "partition")
    Error <rlang_error>
      Available modes are: 'partition'

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw"))
    Error <rlang_error>
      Available modes are: 'partition', 'raw'

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"))
    Error <rlang_error>
      Available modes are: 'partition', 'raw', 'another one'

---

    Code
      stop_incompatible_mode(spec_modes = "partition", eng = "stats")
    Error <rlang_error>
      Available modes for engine stats are: 'partition'

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw"), eng = "stats")
    Error <rlang_error>
      Available modes for engine stats are: 'partition', 'raw'

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"), eng = "stats")
    Error <rlang_error>
      Available modes for engine stats are: 'partition', 'raw', 'another one'

---

    Code
      stop_incompatible_mode(spec_modes = "partition", model = "shallow")
    Error <rlang_error>
      Available modes for model type shallow are: 'partition'

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw"), model = "shallow")
    Error <rlang_error>
      Available modes for model type shallow are: 'partition', 'raw'

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"),
      model = "shallow")
    Error <rlang_error>
      Available modes for model type shallow are: 'partition', 'raw', 'another one'

---

    Code
      stop_incompatible_mode(spec_modes = "partition", eng = "stats", model = "shallow")
    Error <rlang_error>
      Available modes for model type shallow with engine stats are: 'partition'

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw"), eng = "stats",
      model = "shallow")
    Error <rlang_error>
      Available modes for model type shallow with engine stats are: 'partition', 'raw'

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"), eng = "stats",
      model = "shallow")
    Error <rlang_error>
      Available modes for model type shallow with engine stats are: 'partition', 'raw', 'another one'

