(defun ri-new-injector-branch (name)
    (interactive "sName: ")
    (ri-new-branch name  "product-injector-api"))

(defun ri-new-tools-branch (name)
    (interactive "sName: ")
    (ri-new-branch name  "product-injector-tools"))

(defun ri-new-backbone-branch (name)
    (interactive "sName: ")
    (ri-new-branch name  "product-backbone-v2"))

(defun ri-new-product-teraform-branch (name)
    (interactive "sName: ")
    (ri-new-branch name  "product-terraform-v2"))

(defun ri-repo-path (which)
  (concat joe-code-root "ri/" which))

(defun ri-new-branch (name repo)
     (magit (ri-repo-path repo))
    (magit-call-git "fetch" "origin" "master")
    (magit-call-git "branch" name "origin/master")
    (magit-checkout name))
