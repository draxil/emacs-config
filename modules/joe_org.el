(use-package org
  :ensure t
  :config
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
	  ("liffarchive.org" :maxlevel . 1)
	  ))
  (advice-add 'org-refile :after 'org-save-all-org-buffers)


  (setq org-capture-templates
      '(("w" "add work todo" entry (file "~/Dropbox/org/work/now.org")
         "* TODO %?\n  %i\n")
	("l" "add liff todo" entry (file "~/Dropbox/org/liff.org")
         "* TODO %?\n  %i\n")
	;; TODO a liff one?
	))
  (defun capture-liff ()
    (interactive)
    (org-capture nil "l"))


  (setq org-startup-truncated nil)
  (setq org-return-follows-link 't)

  ;; (add-hook 'org-mode-hook '(lambda ()
  ;; 			      (local-set-key (kbd "C-c t") 'org-set-tags)
  ;; 			      ))
					;(find-file "/home/joe/Dropbox/org/work/work.org")

  ;; BULLETS!
  (use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))



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
  :bind
  (:map org-mode-map
	("C-c o s" . org-insert-subheading)
	("C-c o t" . org-set-tags-command)
	("C-c o h" . org-hide-subtree)
	("C-c o s" . org-store-link)
  )
)

(defun joe-open-work-org () "" (interactive) (find-file "~/Dropbox/org/work/work.org"))
(defun joe-open-work-now-org () "" (interactive) (find-file "~/Dropbox/org/work/now.org"))
(defun joe-open-liff-org () "" (interactive) (find-file "~/Dropbox/org/liff.org"))
