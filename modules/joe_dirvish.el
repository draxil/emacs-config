;; on trial, if we ever go back to dired, remember to restore the
;; dired / dired single el files from git.
(use-package
 dirvish
 :straight t
 :config
 (setq dirvish-reuse-session nil)
 (dirvish-override-dired-mode))
