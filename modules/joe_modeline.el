(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                (:propertize
                 (""
                  mode-line-mule-info
                  mode-line-client
                  mode-line-modified))
                mode-line-frame-identification
                "%b"
                "   "
                "%l/%c %n "
                (vc-mode vc-mode)
                "  "
                mode-line-misc-info
                mode-line-end-spaces))
