# check_spec_mode_engine_val() works

    Code
      check_spec_mode_engine_val("hoop", "raw", "stats")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for engine stats are:
      * "unknown" and "partition".

# stop_incompatible_mode() works

    Code
      stop_incompatible_mode(spec_modes = "partition")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes are:
      * "partition".

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw"))
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes are:
      * "partition" and "raw".

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"))
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes are:
      * "partition", "raw", and "another one".

---

    Code
      stop_incompatible_mode(spec_modes = "partition", eng = "stats")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for engine stats are:
      * "partition".

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw"), eng = "stats")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for engine stats are:
      * "partition" and "raw".

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"), eng = "stats")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for engine stats are:
      * "partition", "raw", and "another one".

---

    Code
      stop_incompatible_mode(spec_modes = "partition", model = "shallow")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for model type shallow are:
      * "partition".

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw"), model = "shallow")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for model type shallow are:
      * "partition" and "raw".

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"),
      model = "shallow")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for model type shallow are:
      * "partition", "raw", and "another one".

---

    Code
      stop_incompatible_mode(spec_modes = "partition", eng = "stats", model = "shallow")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for model type shallow with engine stats are:
      * "partition".

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw"), eng = "stats",
      model = "shallow")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for model type shallow with engine stats are:
      * "partition" and "raw".

---

    Code
      stop_incompatible_mode(spec_modes = c("partition", "raw", "another one"), eng = "stats",
      model = "shallow")
    Condition
      Error in `stop_incompatible_mode()`:
      x Available modes for model type shallow with engine stats are:
      * "partition", "raw", and "another one".

