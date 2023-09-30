(use-package yasnippet
  :straight t
  :diminish 'yas-minor-mode
  :config
  (yas-global-mode 1)

  :bind(
	:map yas-minor-mode-map ( 
	     ("C-<tab>" . yas-expand)
	     ("TAB" . nil)
	     ("<tab>" . nil)
  ))
(use-package yasnippet-snippets
  :straight t
  :after yasnippet)
