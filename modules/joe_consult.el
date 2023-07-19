(use-package consult
  :straight t
  :bind(
	("M-s s" . consult-line)
  )
  :config
 (consult-customize
  consult-yank-from-kill-ring
  :preview-key '("M-.")
  ))
