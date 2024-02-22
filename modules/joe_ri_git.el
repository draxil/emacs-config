(defun ri-new-injector-branch (name)
  (interactive "sName: ")
  (ri-new-branch name "product-injector-api"))

(defun ri-new-tools-branch (name)
  (interactive "sName: ")
  (ri-new-branch name "product-injector-tools"))

(defun ri-new-backbone-branch (name)
  (interactive "sName: ")
  (ri-new-branch name "product-backbone-v2"))

(defun ri-new-product-teraform-branch (name)
  (interactive "sName: ")
  (ri-new-branch name "product-terraform-v2"))

(defun ri-new-service-branch (name)
  (interactive "sName: ")
  (ri-new-branch name "svi-services"))

(defun ri-new-service-branch-support ()
  (interactive)
  (ri-new-branch
   (read-string "Name: "
                (joe-work-get-current-support-sprint))
   "svi-services"))

(defun ri-new-platform-branch-support ()
  (interactive)
  (ri-new-branch
   (read-string "Name: "
                (joe-work-get-current-support-sprint))
   "svi-platform"))


(defun ri-new-service-branch-for-ticket ()
  (interactive)
  (ri-new-branch-for-ticket "svi-services"))

(defun ri-new-platform-branch-for-ticket ()
  (interactive)
  (ri-new-branch-for-ticket "svi-platform"))

(defun ri-new-platform-branch (name)
  (interactive "sName: ")
  (ri-new-branch name "svi-platform"))

(defun ri-repo-path (which)
  (concat joe-code-root "ri/" which))

(defun ri-new-branch (name repo)
  (magit (ri-repo-path repo))
  (magit-call-git "fetch" "origin" "master")
  (magit-call-git "branch" name "origin/master")
  (magit-checkout name))


(defun ri-new-branch-for-ticket (repo)
  (ri-new-branch
   (read-string "Name:"
                (car
                 (string-split (completing-read
                                "Which: "
                                (joe-work-current-tickets-like
                                 (read-string "Search: ")))
                               "\t")))
   repo))
