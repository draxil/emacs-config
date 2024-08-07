(defun capture-work ()
  (interactive)
  (org-capture nil "w"))

(defun joe-work-org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (let ((org-archive-location "work.org::* *RECENT*"))
       (org-archive-subtree)
       (setq org-map-continue-from
             (org-element-property :begin (org-element-at-point)))))
   "/DONE" 'file)
  (org-save-all-org-buffers))

(defun current-support-sprint ()
  (interactive)
  (insert (joe-work-get-current-support-sprint)))

(defun joe-work-get-current-support-sprint ()
  (string-replace
   "\n" ""
   (shell-command-to-string
    "jira issue list -q 'sprint in openSprints() and Team = \"30d59576-b991-432c-a0f3-5b2ddb890128-104\" and Summary ~ \"%Support Sprint%\"' --plain --columns id --no-headers")))


(defun joe-work-current-tickets-like (this)
  ; dropped the this match temporarily as it wasn't working correctly, todofix.
  (string-split
   (shell-command-to-string
    (concat
     "jira issue list -q 'sprint in openSprints() and Team = \"30d59576-b991-432c-a0f3-5b2ddb890128-104\" ' --plain --columns id,summary --no-headers"))
   "\n" "\n"))


(defun joe-work-view-current-sprint ()
  (interactive)
  (joe-work-show-ticket (joe-ticket-from-current-sprint)))
(defun joe-work-view-3-amigos ()
  (interactive)
  (joe-work-show-ticket
   (joe-ticket-from-jql
    "project = \"RET\" and labels = \"3_Amigos_Required\" and status=\"To Do\"")))

(defun joe-insert-current-sprint-ticket ()
  (interactive)
  (insert (joe-ticket-from-current-sprint)))

(defun joe-insert-my-ticket-org-link ()
  (interactive)
  (ri-org-link-from-url
   (concat
    "https://riverisland.atlassian.net/browse/" (joe-my-tickets))))

(defun joe-org-insert-my-ticket ()
  (interactive)
  (let ((my-ticket (joe-my-tickets)))
    (ri-org-link-from-url
     (concat "https://riverisland.atlassian.net/browse/" my-ticket))
    (insert (concat " " (joe-work-describe-ticket my-ticket)))))


(defun joe-ticket-from-current-sprint ()
  (joe-ticket-from-jql
   "sprint in openSprints() and Team = \"30d59576-b991-432c-a0f3-5b2ddb890128-104\""))

(defun joe-ticket-from-jql (jql)
  (joe-first-from-column-row
   (completing-read
    "Ticket: "
    (string-split (shell-command-to-string
                   (concat
                    "jira issue list -q '"
                    jql
                    "' --plain --columns id,Summary --no-headers"))
                  "\n" "\n"))))

(defun joe-first-from-column-row (row)
  (car (string-split row "\t")))
(defun joe-last-from-column-row (row)
  (car (cdr (string-split row "\t"))))

(defun joe-work-show-ticket (ticket)
  (shell-command (concat "jira issue view --plain " ticket)
                 (concat "*" ticket "*")))
(defun joe-work-describe-ticket (ticket)
  (chomp
   (joe-last-from-column-row
    (shell-command-to-string
     (concat
      "jira issue list --columns summary --plain --no-headers -q 'id="
      ticket
      "'")))))


;; Show the ticket for the id at point,
(defun joe-work-show-jira-at-point ()
  (interactive)
  (joe-work-show-ticket (symbol-name (symbol-at-point))))

(defun joe-my-jira ()
  (interactive)
  (joe-work-show-ticket (joe-my-tickets)))

(defun joe-my-tickets ()
  (joe-ticket-from-jql
   "sprint in openSprints() and assignee = 6220ec42db58c1006879e625 "))
