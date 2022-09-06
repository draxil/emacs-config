(use-package dired
  :config
  (setq dired-auto-revert-buffer #'dired-directory-changed-p)
  :hook (
	 (dired-mode . (lambda ()
			 (dired-hide-details-mode)
			 (hl-line-mode)
			 )
  )
  ))
