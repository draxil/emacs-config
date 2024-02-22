(defun joe-chmod-file ()
  "chmod the current buffer file"
  (interactive)
  (chmod
   (buffer-file-name) (read-file-modes "perms: " (buffer-file-name))))

(defun joe-make-script-exe ()
  "chmod +x the file if a script"
  (interactive)
  (executable-make-buffer-file-executable-if-script-p))
