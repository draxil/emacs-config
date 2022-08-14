(use-package olivetti
  :straight t
  :hook (
	 (olivetti-mode-on . (lambda()
			       (visual-line-mode)
			       (set-fringe-style 0)
			       ))
  	 (olivetti-mode-off . (lambda()
				(set-fringe-style nil)
			       ))))
