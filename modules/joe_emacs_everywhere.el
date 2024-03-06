(use-package
 emacs-everywhere
 :straight t
 :config
 :hook
 (emacs-everywhere-mode
  . (lambda () (setq-local require-final-newline 'nil)))
 :bind
 (:map
  emacs-everywhere-mode-map
  ("C-c C-c" . 'emacs-everywhere--finish-or-ctrl-c-ctrl-c)))
