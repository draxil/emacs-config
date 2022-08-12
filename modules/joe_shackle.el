;; Shackle provides control over emacs "windows" and how they open.
(use-package shackle
  :straight t
  :init
  (shackle-mode)
  :config
  (setq shackle-rules '(
			("*vertico-buffer*" :align below :popup t)
			("*vterm*" :align below :popup t)
			("*Go Test*" :align below :popup t)
			)
	;; When we want "extreme" shackling
	;;shackle-default-rule '(:same t))

	;; hugely on trial:
	shackle-default-rule '(:other t)
  ))
