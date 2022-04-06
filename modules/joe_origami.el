(use-package origami
  :straight t
  :bind (
	 :map origami-mode-map
	 ("C-<return>" . origami-toggle-node)
	 ))

(use-package lsp-origami
  :straight t
  :init
  (add-hook 'lsp-after-open-hook #'lsp-origami-try-enable))
