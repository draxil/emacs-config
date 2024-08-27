;; TODO a lot of these accept a region, but then use the region after changes
;; TODO should be elsewhere? and maybe only eval when js happens?

(defun json-to-single-line (beg end)
  "Collapse prettified json in region between BEG and END to a single line"
  (interactive "r")
  (if (use-region-p)
      (json-pretty-print beg end t)
    ;; (save-excursion
    ;;   (save-restriction
    ;;     (narrow-to-region beg end)
    ;;     (goto-char (point-min))
    ;;     (while (re-search-forward "[[:space:]\n]+" nil t)
    ;;       (replace-match " "))))
    (print "This function operates on a region")))

(defun joe-deflate-escape-json (beg end)
  "make json one line and quote escape it"
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (save-restriction
          (json-to-single-line beg end)
          (joe-escape-double-quotes
           (region-beginning) (region-end)))))
  (print "This function operates on a region"))

(defun joe-inflate-de-escape-json (beg end)
  "reverse joe-deflate-escape-json"
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (save-restriction
          (joe-de-escape-double-quotes beg end)
          (json-pretty-print (region-beginning) (region-end))))
    (print "This function operates on a region")))

(defun joe-replace-json-buffer ()
  "clear buffer, paste json, make sure we're in js mode and format the json"
  (interactive)
  (joe-clear-buffer)
  (yank)
  (json-pretty-print-buffer)
  (json-mode))

(defun joe-json-to-new-buffer ()
  "put json in a new buffer and format it"
  (interactive)
  (switch-to-buffer (generate-new-buffer "pasted.json"))
  (joe-replace-json-buffer))


(use-package
 json-mode
 :straight t
 :config
 :hook
 (json-mode
  .
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq js-indent-level 2))))
