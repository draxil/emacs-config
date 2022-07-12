(use-package multiple-cursors
  :ensure t
  :bind (
	( "C-S-c C-S-c" . 'mc/edit-lines)
	("C-S-a C-S-a" . 'mc/edit-beginnings-of-lines)
	("C-c C->" . 'mc/mark-all-like-this)
	("C->" . 'mc/mark-next-like-this)
	:map multiple-cursors-mode
	(("C-?" . 'mc/unmark-next-like-this)
	 ("C-c C-?".'mc/skip-to-next-like-this)
	 ("C-<" . 'mc/mark-previous-like-this)
	 ("C-S-s" . 'phi-search)
	 ("C-S-r" . 'phi-search-backward)))
  )

;; purely for mc at the moment, but see if it's okay to replace?
(use-package phi-search
 :straight t)
