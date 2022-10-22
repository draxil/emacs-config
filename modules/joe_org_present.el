(use-package "org-present"
  :straight t
  :config
  :bind (  
	 :map org-present-mode-keymap (
				       ("C-c c" . org-present-show-cursor)
				       ("C-c h" . org-present-hide-cursor)
				       )
  )
  :hook

  (org-present-mode .
			 (lambda ()
			   (setq-local face-remapping-alist '(
							      (default (:height 1.0) variable-pitch)
							      (header-line (:height 4.5) variable-pitch)
							      (org-document-title (:height 1.75) org-document-title)
							      (org-code (:height 1.0) org-code)
							      (org-verbatim (:height 1.0) org-verbatim)
							      (org-block (:height 1.25) org-block)
							      (org-block-begin-line (:height 0.7) org-block)
							      )
				       org-hide-leading-stars 't
				       org-adapt-indentation 't
				       org-fontify-whole-heading-line 't
				       cursor-type 'box
				       )
			   (olivetti-mode 1)
			   ;; this is essentially a hack to fix org-presents UGLY handling of headings
			   (use-package "org-modern"
			     :straight t)
			   (org-modern-mode 1)
			   (use-package "hide-mode-line"
			     :straight t)
			   (fontaine-set-preset 'large 't)
			   (org-display-inline-images)
			   ;;(org-present-hide-cursor)
			   (org-present-read-only)
			   (setq-local header-line-format " ")
			   (turn-on-hide-mode-line-mode)
			   (org-present-beginning)
			   (joe-load-light-theme)
			   ))
  (org-present-mode-quit .
			      (lambda ()
				(kill-local-variable 'face-remapping-alist)
				(fontaine-set-preset 'regular 't)
				(org-remove-inline-images)
				;;(org-present-show-cursor)
				(org-present-read-write)
				(olivetti-mode 0)
				(org-modern-mode 0)
				(kill-local-variable 'header-line-format)
				(kill-local-variable 'org-hide-leading-stars)
				(turn-off-hide-mode-line-mode)
				(joe-load-default-theme)
				)))
