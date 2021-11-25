;;; notmuch -- email
(use-package notmuch
  :config
  (setq notmuch-fcc-dirs '(("joe@higton.uk" . "sent +sent -unread -new -inbox")
			   ))
  (setq notmuch-archive-tags '("-inbox" "-unread"))
  (add-hook 'notmuch-message-mode-hook
	  '(
	    lambda()
		  (auto-fill-mode -1)
		  ))

  )
