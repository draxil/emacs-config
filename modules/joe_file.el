(defun joe-chmod-file ()
  "chmod the current buffer file"
  (interactive)
  (chmod (buffer-file-name) (read-file-modes "perms: " (buffer-file-name) )))
