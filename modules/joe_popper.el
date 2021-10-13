(use-package popper
  :ensure t ; or :straight t
  :bind (("C-#"   . popper-toggle-latest)
         ("M-#"   . popper-cycle)
         ("C-M-#" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
      '("\\*Messages\\*"
        "Output\\*$"
        "\\*Async Shell Command\\*"
	"*Go Test*"
        help-mode
        compilation-mode))
  ;; FUTURE: if we get a window controlling thing consider popper-display-control 'user
  ;; FUTURE: look at grouping
  (popper-mode +1)
  (popper-echo-mode +1))  
