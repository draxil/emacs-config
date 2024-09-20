(use-package
 lsp-mode
 :straight t
 :commands (lsp lsp-deferred)
 :custom
 (lsp-ui-doc-show-with-cursor nil "dont want popups with cursor")
 (lsp-go-env
  '((GOFLAGS
     . "-tags=unit,integration,acceptance,integ_tests,unit_tests"))
  "want unit tests etc")
 :hook
 ((go-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  (python-mode . lsp))
 :config (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
 :bind
 (:map
  lsp-command-map
  (("s" . lsp-describe-thing-at-point)
   ("d" . lsp-find-type-definition))))


;; Optional - provides fancier overlays.
;(use-package lsp-ui
;  :ensure t
;  :commands lsp-ui-mode)

;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
