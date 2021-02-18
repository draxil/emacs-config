

(use-package go-mode
  :config
  :bind (
	 :map go-mode-map
	      (("C-c t t" . go-test-current-file))
	      (("C-c t f" . go-test-current-test))
  ))
