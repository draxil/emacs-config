(use-package terraform-mode
  :straight t
  :hook (
	 (terraform-mode . terraform-format-on-save-mode)))
