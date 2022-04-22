
(use-package go-mode
  :straight t
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (use-package gotest
    :straight t
    :config
    )
  (setq-local show-trailing-whitespace t)
  :hook
  (go-mode . (lambda()
	       (display-line-numbers-mode)
	       (flyspell-prog-mode)
	       (joe-go-test-all-tags)
	       (origami-mode)
	       ))
  :bind (
	 :map go-mode-map
	      (
	       ("C-c t t" . go-test-current-project)
	       ("C-c t f" . go-test-current-test)
	       ("C-c t u" . joe-go-test-unit-mode)
	       ("M-s f" . (lambda()
			    (interactive)
			    (consult-line "func ")))
	       )))


;; TODO make this a toggle
(defun joe-go-test-all-tags ()
  (interactive)
  (setq-local go-test-args "-tags=unit,'',integration"))

(defun joe-go-test-no-tag-mode ()
  (interactive)
  (setq-local go-test-args ""))


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

(defun joe-go-package-to-kill ()
  "get the current package into the kill-ring"
  (interactive)
  (kill-new (chomp (shell-command-to-string "go list"))))

(use-package ginkgo-mode
  :straight (ginkgo-mode :type git :host github :repo "draxil/ginkgo-mode")
  :custom
  (ginkgo-flags "-tags=unit" "run unit tests by default"))
