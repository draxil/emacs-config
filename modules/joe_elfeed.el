(use-package elfeed
  :straight t
  :custom
    (elfeed-db-directory "~/Nextcloud/elfeed")
  :init
  (use-package elfeed-org
    :straight t
    :init
    (elfeed-org)
    (setq rmh-elfeed-org-files (list "~/Nextcloud/org/elfeed.org"))
    :hook
    (elfeed-db-update 'elfeed-db-save)
    ))
 
