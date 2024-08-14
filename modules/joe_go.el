(defvar rinj-go-mode nil
  "are we in ri-injector type project?")

(use-package
 go-mode
 :straight t
 :config
 (use-package gotest :straight t :config)
 (setq-local show-trailing-whitespace t)
 (setq lsp-go-use-gofumpt t)
 :hook
 (go-mode
  .
  (lambda ()
    (display-line-numbers-mode 1)
    (flyspell-prog-mode)
    (joe-go-test-all-tags)
    ;; TRYING INSTEAD OF ORIGAMI
    (yafolding-mode)
    (setq fill-column 100)

    ;; make sure golangci-lint is run after the lsp checker
    (if (bound-and-true-p lsp-mode)
        (flycheck-add-next-checker 'lsp 'golangci-lint))

    ;; pre save hook, don't just let go-mode do this as when in lsp we go there as easier use of gofumpt:
    (add-hook
     'before-save-hook
     (lambda ()
       (if (eq major-mode 'go-mode)
           (joe-go-save-hook))))


    ;; this should be done by gomode IMO, make goimports a safe choice
    ;; for gofmt, we use this in some dir-locals for projects that need this
    (add-to-list
     'safe-local-variable-values '(gofmt-command . "goimports"))))
 :bind
 (:map
  go-mode-map
  (("C-c t t" . joe-go-test-current-project)
   ("C-c t f" . go-test-current-test)
   ("C-c t u" . joe-go-test-unit-mode)
   ("M-s f" .
    (lambda ()
      (interactive)
      (consult-line "func "))))))

(defun joe-go-test-current-project ()
  "Run tests in an appropreate way."
  (interactive)
  (if rinj-go-mode
      (rinj-ginkgo)
    (go-test-current-project)))

;; TODO make this a toggle
(defun joe-go-test-all-tags ()
  (interactive)
  (setq-local go-test-args
              "-tags=unit,integration,unit_tests,integ_tests"))

(defun joe-go-test-no-tag-mode ()
  (interactive)
  (setq-local go-test-args ""))

(defun joe-go-test-unit-mode ()
  (interactive)
  (setq-local go-test-args "-tags=unit,unit_tests"))


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

(use-package
 ginkgo-mode
 :straight
 (ginkgo-mode :type git :host github :repo "garslo/ginkgo-mode")
 :custom (ginkgo-flags "-tags=unit" "run unit tests by default"))

(defun joe-go-save-hook ()
  ;; clumsy HACK! but the lsp organise was not cutting it and
  ;; often gofmt is gofumpt now, which doesn't do goimports! So
  ;; this is the short term fudge, go back to the lsp version
  ;; when we can.
  (if (and lsp-go-goimports-local lsp-mode)
      (let ((actual-gofmt gofmt-command)
            (actual-gofmt-args gofmt-args))
        (lsp-format-buffer)
        (setq gofmt-command "goimports")
        (setq gofmt-args
              `(,(format "-local=%s" lsp-go-goimports-local)))
        (gofmt)
        (setq gofmt-command actual-gofmt)
        (setq gofmt-args actual-gofmt-args))
    (gofmt-before-save)))
