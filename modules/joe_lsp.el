(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :custom
  (lsp-ui-doc-show-with-cursor nil "dont want popups with cursor")
  (lsp-go-env '((GOFLAGS . "-tags='' -tags=unit -tags=integration")) "want unit tests etc")
  :hook (
	 (go-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration)
	 )
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  )


;; Optional - provides fancier overlays.
;(use-package lsp-ui
;  :ensure t
;  :commands lsp-ui-mode)

(use-package helm-lsp :commands helm-lsp-workspace-symbol)
