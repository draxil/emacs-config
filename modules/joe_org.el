
(setq org-directory "~/Nextcloud/org")

(defun joe-org-file (filename)
  "find one of my org files"
  (concat org-directory "/" filename ".org"))

(use-package
 org
 :straight t
 :config

 (setq org-mobile-inbox-for-pull (joe-org-file "in"))
 (setq org-agenda-files
       `(,(joe-org-file "liff")
         ,(joe-org-file "now")
         ,(joe-org-file "liffnow")
         ,(joe-org-file "pets")))

 (setq org-refile-targets
       `((nil :maxlevel . 1)
         (org-agenda-files :maxlevel . 2)
         (,(joe-org-file "work") :maxlevel . 2)
         (,(joe-org-file "liffarchive") :maxlevel . 1)))
 (advice-add 'org-refile :after 'org-save-all-org-buffers)
 (advice-add 'org-clock-out :after 'org-save-all-org-buffers)


 (setq org-capture-templates
       `(("w"
          "add work todo"
          entry
          (file ,(joe-org-file "now"))
          "* TODO %?\n  %i\n")
         ("l"
          "add liff todo"
          entry
          (file ,(joe-org-file "liffnow"))
          "* TODO %?\n  %i\n")))
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
 (use-package
  org-bullets
  :straight t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

 ;; Links to git
 (use-package orgit :straight t)

 (use-package org-contrib :straight t)

 ;; default to open links in same window not a new one:
 (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)

 ;; time tracking
 (setq org-clock-persist 'history)
 (org-clock-persistence-insinuate)

 (setq org-todo-keywords
       '((sequence "TODO" "BLOCK(b)" "|" "DONE(d)")))
 (setq org-todo-keyword-faces '(("BLOCK" . "yellow")))

 (org-babel-do-load-languages
  'org-babel-load-languages '((restclient . t) (shell . t)))
 :bind
 (:map
  org-mode-map
  ("C-c o s" . org-insert-subheading)
  ("C-c o t" . org-set-tags-command)
  ("C-c o h" . org-hide-subtree)
  ("C-c o s" . org-store-link)
  ("C-c o a" . joe-org-archive-done)))

(defun joe-open-work-org ()
  ""
  (interactive)
  (find-file (joe-org-file "work")))
(defun joe-open-work-now-org ()
  ""
  (interactive)
  (find-file (joe-org-file "now")))
(defun joe-open-liff-org ()
  ""
  (interactive)
  (find-file (joe-org-file "liff")))
(defun joe-open-liff-now-org ()
  ""
  (interactive)
  (find-file (joe-org-file "liffnow")))

(defun joe-org-archive-done ()
  (interactive)

  (require 'org-archive)
  (let ((org-archive-location
         (format "%s_archive.org::" (joe-bare-org-name))))

    (if (string= (buffer-name) "liffnow.org")
        (setq org-archive-location "liffnowarch.org::* *RECENT*"))
    (if (string= (buffer-name) "now.org")
        (setq org-archive-location "worknowarch.org::* *RECENT*"))

    (org-map-entries
     (lambda ()
       (message "%s" (org-get-heading))
       (org-archive-subtree)
       (setq org-map-continue-from
             (org-element-property :begin (org-element-at-point))))
     "LEVEL=1/DONE" 'file))
  (org-save-all-org-buffers))

(defun joe-bare-org-name ()
  (require 's)
  (s-replace ".org" "" (buffer-name)))
