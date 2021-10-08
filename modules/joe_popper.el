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
  (popper-mode +1)
  (popper-echo-mode +1))  
