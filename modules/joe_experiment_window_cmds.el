;; A random experiment in window commands

(global-set-key [f7] 'other-frame)
(global-set-key [M-f7] 'ace-select-window)
(global-set-key [C-f7] 'joe-kill-other-window)
(global-set-key (kbd "M-g w") 'ace-select-window)


(defun joe-kill-other-window ()
      "If there are multiple windows, kill the next one"
      (interactive)
      (other-window 1)
      (if (not (one-window-p))
          (delete-window)))
