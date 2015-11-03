(require 'mu4e)

;; Only needed if your maildir is _not_ ~/Maildir
;; Must be a real dir, not a symlink
(setq mu4e-maildir "/home/joe/Mail/Work")

(setq mu4e-get-mail-command "offlineimap")
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
(setq mu4e-archive-folder  "/Archives.2015")

(setq mu4e-maildir-shortcuts
      '( ("/INBOX"     . ?i)
         ("/Archives.2015". ?a)))

(setq send-mail-function 'smtpmail-send-it) ; if you use `mail'
(setq message-send-mail-function 'smtpmail-send-it) ; if you use message/Gnus
(setq smtpmail-default-smtp-server "office.printevolved.co.uk") ; set before loading library
(setq smtpmail-smtp-server "office.printevolved.co.uk") ; set before loading library
(setq smtpmail-smtp-service "25")
(setq smtpmail-debug-info t) ; only to debug problems

(setq mu4e-refile-folder "/Archives.2015")
