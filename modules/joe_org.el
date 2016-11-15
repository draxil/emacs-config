(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/in.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files '("~/Dropbox/org/work/work.org"
			 "~/Dropbox/org/liff.org"))
(setq org-startup-truncated nil)

(add-hook 'org-mode-hook '(lambda ()
			    (local-set-key (kbd "C-c t") 'org-set-tags)))
