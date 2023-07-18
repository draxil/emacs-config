(use-package yasnippet
  :straight t
  :defer 2
  :diminish 'yas-minor-mode
  :config
  (yas-global-mode 1)

  ;; SUPER CRUDE PATCH for yasnippet suddenly being annoying! 
  (define-key yas-keymap [(tab)]        nil)
  (define-key yas-keymap (kbd "TAB")    nil)
  (define-key yas-keymap (kbd "<tab>")  nil)

  :bind (:map yas-minor-mode-map
	     ("C-<tab>" . yas-expand)
	     ("TAB" . nil)
	     ("<tab>" . nil)
	     )
  )
(use-package yasnippet-snippets
  :straight t
  :after yasnippet)
