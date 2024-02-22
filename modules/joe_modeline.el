(setq-default mode-line-format
              '("%e" mode-line-front-space
                (:propertize
                 (""
                  mode-line-mule-info
                  mode-line-client
                  mode-line-modified))
                mode-line-frame-identification "%b" "   "
                "%l/%c" ;; line / column
                " %n " ;; narrrow indicator
                (vc-mode vc-mode) ;; vc info
                "  " mode-line-misc-info mode-line-end-spaces))
;; TODO: hmm no major mode info?
