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
							      (org-code (:height 0.8) org-code)
							      (org-verbatim (:height 0.8) org-verbatim)
							      (org-block (:height 0.8) org-block)
							      (org-block-begin-line (:height 0.9) org-block)
							      )
				       org-hide-leading-stars 't
				       org-adapt-indentation 't
				       org-fontify-whole-heading-line 't
				       cursor-type 'box
				       )
			   (delete-other-windows)
			   (olivetti-mode 1)
			   (olivetti-set-width 90)
			   (use-package "hide-mode-line"
			      :straight t)
			   (fontaine-set-preset 'large 1)
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
