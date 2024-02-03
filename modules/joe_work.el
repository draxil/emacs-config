(defun capture-work ()
 (interactive)
 (org-capture nil "w"))

;; VERY PROVISIONAL, move key to keys?
(global-set-key (kbd "C-x w") 'capture-work)

(defun joe-work-org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (let ((org-archive-location "work.org::* *RECENT*"))
       (org-archive-subtree)
       (setq org-map-continue-from (org-element-property :begin (org-element-at-point)))))
   "/DONE" 'file)
  (org-save-all-org-buffers))

(defun current-support-sprint ()
  (interactive)
  (insert (joe-work-get-current-support-sprint)))

(defun joe-work-get-current-support-sprint()
 (string-replace "\n" "" (shell-command-to-string  "jira issue list -q 'sprint in openSprints() and Team = \"30d59576-b991-432c-a0f3-5b2ddb890128-104\" and Summary ~ \"%Support Sprint%\"' --plain --columns id --no-headers")))


(defun joe-work-current-tickets-like (this)
  (string-split (shell-command-to-string  (concat "jira issue list -q 'sprint in openSprints() and Team = \"30d59576-b991-432c-a0f3-5b2ddb890128-104\" and Summary ~ \"%" this "%\"' --plain --columns id,summary --no-headers")) "\n" "\n"))


(defun joe-work-view-current-sprint ()
  (interactive)
  (joe-work-show-ticket
   (joe-first-from-column-row
    (completing-read
     "Ticket: "
     (string-split
      (shell-command-to-string  "jira issue list -q 'sprint in openSprints() and Team = \"30d59576-b991-432c-a0f3-5b2ddb890128-104\"' --plain --columns id,Summary --no-headers")
      "\n" "\n")))))

(defun joe-first-from-column-row (row)
  (car (string-split row "\t")))

(defun joe-work-show-ticket (ticket)
  (shell-command
   (concat "jira issue view --plain " ticket)
   (concat "*" ticket "*")))

