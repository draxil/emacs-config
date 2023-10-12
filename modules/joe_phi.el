;; used to be just for multicursor, now just tying it!
(use-package phi-search
  :straight t
  :bind (
	 ("C-s" . phi-search)
	 ("C-r" . phi-search-backward)
	 ))
