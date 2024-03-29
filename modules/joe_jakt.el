(let ((jakt-mode-path "~/code/jakt/editors/emacs/")) 
  (if (file-directory-p jakt-mode-path) 
      (progn (add-to-list 'load-path jakt-mode-path)
	     (message (concat jakt-mode-path "jakt-mode.el"))
	     (if (file-regular-p (concat jakt-mode-path "jakt-mode.el")) 
		 (progn (message "[jakt] someone merged the PR! Tidy up!") 
			(autoload 'jakt-mode "jakt-mode" nil t)) 
	       (autoload 'jakt-mode "jakt_mode" nil t))
	     (add-to-list 'auto-mode-alist '("\\.jakt\\'" . jakt-mode)))))
