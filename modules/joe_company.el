
(use-package company
  :bind (:map company-mode-map
	 ("M-<tab>" . company-complete))
  :config
  (setq company-begin-commands ()))
