;; when in exile,,,
(setq-default mac-right-option-modifier nil)
(when (eq system-type 'darwin)

      ;; default Latin font (e.g. Consolas)
      (set-face-attribute 'default nil :family "Consolas")

      ;; default font size (point * 10)
      ;;
      ;; WARNING!  Depending on the default font,
      ;; if the size is not supported very well, the frame will be clipped
      ;; so that the beginning of the buffer may not be visible correctly. 
      (set-face-attribute 'default nil :height 165)
      ;; you may want to add different for other charset in this way.

      (use-package exec-path-from-shell
	:straight t
	:init
	(exec-path-from-shell-initialize)
	)

      ;; hard to type a hash on a mac keyboard 🤦‍♂️
      (global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
      (unbind-key "s-l")
      )
