(use-package
 magit
 :straight t
 :config
 ;; highlight diff inside lines
 (customize-set-value 'magit-diff-refine-hunk 'all))

(use-package transient :straight t)

(defun joe-git-commit-mode-hook ()
  "When opening a commit, do this"

  ;; Where there's nothing on the commit line, maybe insert a ticket
  ;; looking thing from the branch
  (when (not (word-at-point))
    (let ((bn (magit-get-current-branch)))
      (when (string-match "^\\([A-Z]\\{3\\}-[0-9]+\\)" bn)
        (insert (format "%s " (match-string 1 bn)))))))

(add-hook 'git-commit-setup-hook 'joe-git-commit-mode-hook)
