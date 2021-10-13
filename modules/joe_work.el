(defun capture-work ()
 (interactive)
 (org-capture nil "w"))

;; VERY PROVISIONAL, move key to keys?
(global-set-key (kbd "C-x w") 'capture-work)
