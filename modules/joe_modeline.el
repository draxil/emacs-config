
(setq-default mode-line-format
              `("%e" mode-line-front-space
                (""
                 mode-line-mule-info
                 mode-line-client
                 joe-modeline-file-indicator)
                mode-line-frame-identification
                "%b" ;; buffer name
                "   "
                "%l/%c" ;; line / column
                " %n " ;; narrrow indicator
                (vc-mode vc-mode) ;; vc info
                "  " mode-line-misc-info mode-line-end-spaces))
;; TODO: hmm no major mode info?

(defvar-local joe-modeline-file-indicator
    '(:eval
      (if (buffer-modified-p)
          "*"
        (if buffer-read-only
            "#"
          "-"))))
(put 'joe-modeline-file-indicator 'risky-local-variable t)
