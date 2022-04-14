(use-package yasnippet
  :defer 2
  :diminish 'yas-minor-mode
  :config
  (yas-global-mode 1)
  :bind (:map yas-minor-mode-map
	     ("<backtab>" . yas-expand)
	     ("TAB" . nil)
	     ("<tab>" . nil)
	     )
  )
