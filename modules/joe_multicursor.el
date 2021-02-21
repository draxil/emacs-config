(use-package multiple-cursors
  :bind (
	( "C-S-c C-S-c" . 'mc/edit-lines)
	("C-S-a C-S-a" . 'mc/edit-beginnings-of-lines)
	("C-c C->" . 'mc/mark-all-like-this)
	("C->" . 'mc/mark-next-like-this)
	:map multiple-cursors-mode-hook
	("C-?" . 'mc/unmark-next-like-this)
	("C-<" . 'mc/mark-previous-like-this)
	)
  )
