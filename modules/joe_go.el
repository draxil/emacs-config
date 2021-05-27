

(use-package go-mode
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  :bind (
	 :map go-mode-map
	      (("C-c t t" . go-test-current-project))
	      (("C-c t f" . go-test-current-test))
  ))
