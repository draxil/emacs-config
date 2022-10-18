(use-package ace-jump-zap
  :straight t
  :config
  (global-set-key (kbd "M-z") 'ace-jump-zap-to-char)
  (global-set-key (kbd "M-Z") 'ace-jump-zap-up-to-char))
