(use-package
 elfeed
 :straight t
 :commands (elfeed)
 :custom (elfeed-db-directory "~/Nextcloud/elfeed"))
(use-package
 elfeed-org
 :straight t
 :after (elfeed)
 :init
 (elfeed-org)
 (setq rmh-elfeed-org-files (list "~/Nextcloud/org/elfeed.org"))
 :hook
 (elfeed-db-update
  .
  (lambda ()
    (message "doing elfeed hook")
    (elfeed-db-save))))
