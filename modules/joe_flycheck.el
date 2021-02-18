(use-package flycheck
  :defer 2
  :init
  :hook (web-mode . my/set-local-eslint)
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (global-flycheck-mode))
