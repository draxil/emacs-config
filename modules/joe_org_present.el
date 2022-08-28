(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
		 (fontaine-set-preset 'large)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)
		 (turn-on-hide-mode-line-mode)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
		 (fontaine-set-preset 'regular)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)
		 (turn-off-hide-mode-line-mode)))))
