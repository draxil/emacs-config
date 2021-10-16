(use-package consult
  :straight t
  :config
  (consult-customize
   consult-yank-from-kill-ring
   :preview-key (kbd "M-."))
  )
