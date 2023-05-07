;; Guix environment manifest for Pokemon Prism development
;; Use with `guix environment -m guix.scm' to open a shell.
;; To make sure building the ROM depends only on the packages listed, use
;; `guix environment --pure -m guix.scm -- make'.
;;
;; If the version of RGBDS used here is no longer available, you may use
;; guix time-machine --commit=af03dccea1e3f15209e2664a47912f3efd34bbd3

(specifications->manifest
  (list
    "coreutils"
    "make"
    "gcc-toolchain"
    "python"
    "python-pypng"
    "rgbds@0.4.0"
    ;; For hexdump(1), used for `make patch'
    "util-linux"))
