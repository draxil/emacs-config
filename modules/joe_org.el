
(setq org-directory "~/Nextcloud/org")

(defun joe-org-file (filename)
  "find one of my org files"
  (concat org-directory "/" filename ".org"))

(use-package org
  :straight t
  :config
  
  (setq org-mobile-inbox-for-pull (joe-org-file "in"))
  (setq org-agenda-files
	`(,(joe-org-file "liff")
	  ,(joe-org-file "now")
	  ,(joe-org-file "liffnow")))

  (setq org-refile-targets
	'((nil :maxlevel . 1)
	  (org-agenda-files :maxlevel . 2)
	  ("work/arch.org" :maxlevel . 2)
	  ("liffarchive.org" :maxlevel . 1)
	  ))
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  (advice-add 'org-clock-out :after 'org-save-all-org-buffers)


  (setq org-capture-templates
      '(("w" "add work todo" entry (file (joe-org-file "now"))
         "* TODO %?\n  %i\n")
	("l" "add liff todo" entry (file (joe-org-file "liffnow"))
         "* TODO %?\n  %i\n")
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
    :straight t
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

  ;; Links to git
  (use-package orgit
    :straight t)

  ;; default to open links in same window not a new one:
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)

  ;; time tracking
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)

  (setq org-todo-keywords
	'(
	  (sequence "TODO" "BLOCK(b)" "|" "DONE(d)")
	  ))
  (setq org-todo-keyword-faces
	'(
	  ("BLOCK" .  "yellow")
	  ))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((restclient . t)))
  :bind
  (:map org-mode-map
	("C-c o s" . org-insert-subheading)
	("C-c o t" . org-set-tags-command)
	("C-c o h" . org-hide-subtree)
	("C-c o s" . org-store-link)
  )
)

(defun joe-open-work-org () "" (interactive) (find-file (joe-org-file "work")))
(defun joe-open-work-now-org () "" (interactive) (find-file (joe-org-file "now")))
(defun joe-open-liff-org () "" (interactive) (find-file (joe-org-file "liff")))
(defun joe-open-liff-now-org () "" (interactive) (find-file (joe-org-file "liffnow")))

