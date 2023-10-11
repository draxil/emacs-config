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
