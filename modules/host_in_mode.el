
(defconst my-mode-line-buffer-identification
  (list
   '(:eval
     (let ((host-name
            (if (file-remote-p default-directory)
                (tramp-file-name-host
                 (tramp-dissect-file-name default-directory))
              (system-name))))
       (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
           (substring host-name 0 (match-beginning 1))
         host-name)))
   ": %12b"))

(setq-default
 mode-line-buffer-identification
 my-mode-line-buffer-identification)

(add-hook
 'dired-mode-hook
 (lambda ()
   (setq
    mode-line-buffer-identification
    my-mode-line-buffer-identification)))
