(defun ri-new-injector-branch (name)
    (interactive "sName: ")
    (ri-new-branch name  (ri-repo-path "product-injector-api")))

(defun ri-new-backbone-branch (name)
    (interactive "sName: ")
    (ri-new-branch name  (ri-repo-path "product-backbone-v2")))

(defun ri-repo-path (which)
  (concat joe-code-root "ri/" which))

(defun ri-new-branch (name repo)
     (magit repo)
    (magit-call-git "fetch" "origin" "master")
    (magit-call-git "branch" name "origin/master")
    (magit-checkout name))
