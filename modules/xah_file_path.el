
;; copy the current file path, useful for linking.
(defun xah-copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))

;; a simplified hacked up of the above to do org links. Only for files.
(defun joe-path-and-line-to-kill ()
  "Copy the current buffer's file pathand the current line
to `kill-ring', in the org link format.
"
  (interactive)
    (kill-new
     (joe-path-and-line)))

(defun joe-org-link-line-to-kill()
  "Copy the current line as an org link, leaving personalisation of the link name to you"
  (interactive)
  (kill-new
   (concat "[[" (joe-path-and-line) "]" "[" (file-name-nondirectory (buffer-file-name)) "")))

(defun joe-path-and-line ()
  "The path ane line of the current file in org-like format"
  (concat (buffer-file-name) "::" (number-to-string (line-number-at-pos))))

;; version of the above that does the same but with the org line link syntax (/x/file.go::123)
