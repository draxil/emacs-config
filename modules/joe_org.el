(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/in.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files '("~/Dropbox/org/work/work.org"
			 "~/Dropbox/org/liff.org"))
(setq org-startup-truncated nil)
(setq org-return-follows-link 't)

(add-hook 'org-mode-hook '(lambda ()
			    (local-set-key (kbd "C-c t") 'org-set-tags)))
;(find-file "/home/joe/Dropbox/org/work/work.org")
(defun joe-open-work-org () "" (interactive) (find-file "/home/joe/Dropbox/org/work/work.org"))
