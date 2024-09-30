(use-package
 org-jira
 :straight t
 :init
 (setq
  jiralib-url "https://riverisland.atlassian.net"
  org-jira-working-dir "~/.local/ri/org-jira/"
  org-jira-custom-jqls
  '((:jql
     "project = SVP AND assignee = currentUser() and status not in ('Done', 'Rejected') ORDER BY created DESC"
     :limit 10
     :filename "my-active")))
 :bind (:map org-jira-entry-mode-map ("C-c j s" . joe-org-jira-to-kill)))

(defun joe-org-jira-to-kill ()
  "put a JIRA link into the kill ring, tidying up the value"
  (interactive)
  (kill-new
   (string-replace "[description: " "[" (org-store-link nil nil))))
