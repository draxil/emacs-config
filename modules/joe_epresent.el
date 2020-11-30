(use-package epresent
  :config
  (add-hook 'epresent-start-presentation-hook
	    '(
	      lambda()
		    (hide-mode-line-mode +1)
		    (epresent-top)
		    ))
  (add-hook 'epresent-stop-presentation-hook
	    '(
	      lambda()
		    (hide-mode-line-mode -1)
		    ))
  )
  
