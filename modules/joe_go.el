
(use-package go-mode
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (setq-local show-trailing-whitespace t)
  :hook
  (go-mode . (lambda()
	       (display-line-numbers-mode)))
  :bind (
	 :map go-mode-map
	      (("C-c t t" . go-test-current-project))
	      (("C-c t f" . go-test-current-test))
  ))
(defun joe-go-generate ()
  (interactive)
  (shell-command "bash -c 'go generate .'" "*go generate*"))

