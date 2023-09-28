(defun joe-switch-other-buffer ()
  (interactive)
  (switch-to-buffer nil))
(global-set-key (kbd "ESC M-b") 'joe-switch-other-buffer)
