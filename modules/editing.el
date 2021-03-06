(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward)
  (setq uniquify-separator ":")
  (setq uniquify-ignore-buffers-re "^\\*")
  )

(show-paren-mode)
(prefer-coding-system 'utf-8)
(setq backup-directory-alist '(("." . "~/.local/my/emacs/backups")))
