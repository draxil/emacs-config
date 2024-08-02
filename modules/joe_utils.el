;; SHOULD MOVE TO AN ELISP MODULE

(defun joe-insert-iso-utc-datetime ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%TZ" (current-time))))
