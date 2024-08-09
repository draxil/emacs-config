;; on trial, if we ever go back to dired, remember to restore the
;; dired / dired single el files from git.
(use-package
 dirvish
 :straight t
 :init (dirvish-override-dired-mode)
 :config (setq dirvish-reuse-session nil)
 :bind
 (("C-c C-f" . dirvish-fd)
  :map
  dirvish-mode-map
  ("a" . dirvish-quick-access)
  ("f" . dirvish-file-info-menu)
  ("y" . dirvish-yank-menu)
  ("N" . dirvish-narrow)
  ("^" . dirvish-history-last)
  ("h" . dirvish-history-jump) ; remapped `describe-mode'
  ;;  ("s" . dirvish-quicksort) ; remapped `dired-sort-toggle-or-edit'
  ("v" . dirvish-vc-menu) ; remapped `dired-view-file'
  ("TAB" . dirvish-subtree-toggle)
  ("C-c p" . dirvish-peek-mode)
  ("M-f" . dirvish-history-go-forward)
  ("M-b" . dirvish-history-go-backward)
  ("M-l" . dirvish-ls-switches-menu)
  ("M-m" . dirvish-mark-menu)
  ("M-t" . dirvish-layout-toggle)
  ("M-s" . dirvish-setup-menu)
  ("M-e" . dirvish-emerge-menu)
  ("M-j" . dirvish-fd-jump)))
