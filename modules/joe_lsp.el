(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :custom
  (lsp-ui-doc-show-with-cursor nil "dont want popups with cursor")
  :hook (
	 (go-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration)
	 ))


;; Optional - provides fancier overlays.
;(use-package lsp-ui
;  :ensure t
;  :commands lsp-ui-mode)

(use-package helm-lsp :commands helm-lsp-workspace-symbol)
