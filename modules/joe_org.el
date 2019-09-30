(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/in.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files '("~/Dropbox/org/work/work.org"
			 "~/Dropbox/org/liff.org"))
(setq org-agenda-files
      '("~/Dropbox/org/liff.org" "~/Dropbox/org/work/now.org" "~/Dropbox/org/work/work.org"))

(setq org-refile-targets
      '((nil :maxlevel . 1)
	(org-agenda-files :maxlevel . 2)
	("work/arch.org" :maxlevel . 2)
	))


(setq org-startup-truncated nil)
(setq org-return-follows-link 't)

(add-hook 'org-mode-hook '(lambda ()
			    (local-set-key (kbd "C-c t") 'org-set-tags)))
;(find-file "/home/joe/Dropbox/org/work/work.org")
(defun joe-open-work-org () "" (interactive) (find-file "/home/joe/Dropbox/org/work/work.org"))
(defun joe-open-work-now-org () "" (interactive) (find-file "/home/joe/Dropbox/org/work/now.org"))
(defun joe-open-liff-org () "" (interactive) (find-file "/home/joe/Dropbox/org/liff.org"))
;; BULLETS!
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; time tracking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-todo-keywords
      '(
	(sequence "TODO" "BLOCK(b)" "|" "DONE(d)")
	(sequence "BUG" "PROVEN" "|" "FIXED")
	))
(setq org-todo-keyword-faces
      '(
	("BLOCK" .  "yellow")
	))
