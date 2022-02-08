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
