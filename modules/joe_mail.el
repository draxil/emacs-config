(setq mail-specify-envelope-from 't)
(setq message-sendmail-envelope-from 'header)
(setq mail-envelope-from 'header)
(setq sendmail-program "msmtp")
(setq message-sendmail-extra-arguments '())
(setq message-send-mail-function  'message-send-mail-with-sendmail)
(setq message-kill-buffer-on-exit t)
(setq message-auto-save-directory "~/mail/draft")
;; TODO make always like notmuch?
