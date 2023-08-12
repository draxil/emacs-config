(use-package eglot
  :bind (
	 ("s-l d" . eglot-find-typeDefinition)
	 ("s-l s" . eglot-find-declaration)
	 ("s-l r" . eglot-rename)
	 ("s-l a" . eglot-code-actions)
	 ("s-l w" . eglot-code-action-rewrite)
	 )
  :config
  (setq eglot-confirm-server-initiated-edits nil))
