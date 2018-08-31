(require 'mu4e)

;; Only needed if your maildir is _not_ ~/Maildir
;; Must be a real dir, not a symlink
(setq mu4e-maildir "/home/joe/Mail/Work")

(setq mu4e-get-mail-command "offlineimap")
(setq mu4e-update-interval 130)
(setq mu4e-user-mail-address-list '("joe@printevolved.co.uk"))

;; these must start with a "/", and must exist
;; (i.e.. /home/user/Maildir/sent must exist)
;; you use e.g. 'mu mkdir' to make the Maildirs if they don't
;; already exist

;; below are the defaults; if they do not exist yet, mu4e offers to
;; create them. they can also functions; see their docstrings.
(setq
   user-mail-address "joe@printevolved.co.uk"
   user-full-name  "Joseph Higton")

(setq mu4e-sent-folder   "/Sent")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-trash-folder  "/Trash")

(setq mu4e-archive-folder  (format-time-string "/Archives.%Y"))

(setq mu4e-maildir-shortcuts
      `( ("/INBOX"     . ?i)
         ( ,mu4e-archive-folder . ?a)
	 ))

(setq send-mail-function 'smtpmail-send-it) ; if you use `mail'
(setq message-send-mail-function 'smtpmail-send-it) ; if you use message/Gnus
(setq smtpmail-default-smtp-server "office.printevolved.co.uk") ; set before loading library
(setq smtpmail-smtp-server "office.printevolved.co.uk") ; set before loading library
(setq smtpmail-smtp-service "25")
;(setq smtpmail-debug-info t) ; only to debug problems

(setq mu4e-refile-folder mu4e-archive-folder)

(set 'mu4e-bookmarks
  '(("flag:flagged"       "Flagged"     ?f)
    ("from:jeff AND flag:unread AND NOT flag:trashed"       "jmail"     ?j)
    ("from:jeff"       "All Jmail"     ?J)
    ("date:today..now"                  "Today's messages"     ?t)))
(defun joe-mu4e-hook ()
  "Joes mu4e hook"
  (set-variable 'fill-column 100))
(add-hook 'mu4e-compose-mode-hook 'joe-mu4e-hook)
