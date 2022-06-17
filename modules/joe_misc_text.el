(defun joe-escape-double-quotes (beg end)
  "dumbly escapes double quotes"
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (save-restriction
          (narrow-to-region beg end)
          (goto-char (point-min))
          (while (re-search-forward "\"" nil t)
            (replace-match "\\\\\""))))
    (print "This function operates on a region")))
(defun joe-de-escape-double-quotes (beg end)
  "dumbly de-escapes double quotes"
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (save-restriction
          (narrow-to-region beg end)
          (goto-char (point-min))
          (while (re-search-forward "\\\\\"" nil t)
            (replace-match "\""))))
    (print "This function operates on a region")))

;;; todo obey the spaces setting for prog mode
(defun joe-tabs-to-spaces-region (beg end)
  "tabs to spaces"
  (interactive "r")
    (if (use-region-p)
      (save-excursion
        (save-restriction
          (narrow-to-region beg end)
          (goto-char (point-min))
          (while (re-search-forward "	" nil t)
            (replace-match "    "))))
    (print "This function operates on a region")))
(defun joe-nbsp-to-sp-region (beg end)
  "tabs to spaces"
  (interactive "r")
    (if (use-region-p)
      (save-excursion
        (save-restriction
          (narrow-to-region beg end)
          (goto-char (point-min))
          (while (re-search-forward " " nil t)
            (replace-match " "))))
    (print "This function operates on a region")))

(defun joe-chars-in-region (beg end)
    "count characters in the region"
  (interactive "r")
  (if (use-region-p)
      (message (format "%s" (- end beg)))
    (message "This function operates on a region")))

(defun joe-clear-buffer ()
  (interactive)
  (save-excursion
    (save-restriction
      (delete-region (buffer-end 0) (buffer-end 1)))))
