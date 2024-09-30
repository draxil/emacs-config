;;; notmuch -- email
(use-package
 notmuch
 :straight t
 :commands (notmuch)
 :config
 (setq notmuch-fcc-dirs
       '(("joe@higton.uk" . "sent +sent -unread -new -inbox")))
 (setq notmuch-archive-tags '("-inbox" "-unread"))
 (add-hook
  'notmuch-message-mode-hook
  #'(lambda ()
      (auto-fill-mode -1)
      (flyspell-mode 1)
      (auto-fill-mode 1)))

 :bind
 (:map
  notmuch-common-keymap
  ("c" . consult-notmuch)
  ("M" . consult-notmuch-address)))


(use-package consult-notmuch :straight t :after (notmuch))
