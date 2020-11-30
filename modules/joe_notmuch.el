;;; notmuch -- email
(use-package notmuch
  :config
  (setq notmuch-fcc-dirs '(("joe@higton.uk" . "sent +sent -unread -new -inbox")
			   ))
  (add-hook 'notmuch-message-mode-hook
	  '(
	    lambda()
		  (auto-fill-mode -1)
		  ))

  )
