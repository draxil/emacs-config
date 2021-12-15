
(use-package go-mode
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (setq-local show-trailing-whitespace t)
  :hook
  (go-mode . (lambda()
	       (display-line-numbers-mode)
	       (flyspell-prog-mode)
	       ))
  :bind (
	 :map go-mode-map
	      (("C-c t t" . go-test-current-project))
	      (("C-c t f" . go-test-current-test))
  ))
(defun joe-go-generate ()
  (interactive)
  (shell-command "bash -c 'go generate .'" "*go generate*"))

(defun joe-go-mod-init (arg)
  "run go mod init"
  (interactive "spackage: ")
  (shell-command (concat "go mod init " arg) "*go mod*"))

(defun joe-go-mod-tidy ()
  "run go mod tidy"
  (interactive)
  (shell-command "go mod tidy" "*go mod*"))
