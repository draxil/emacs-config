(use-package
 flycheck
 :straight t
 :defer 2
 :init
 ;  :hook ;;(web-mode . my/set-local-eslint)
 :config
 (flycheck-add-mode 'javascript-eslint 'web-mode)
 (setq flycheck-check-syntax-automatically '(mode-enabled save))
 (global-flycheck-mode)
 (setq-default flycheck-disabled-checkers
               (append
                flycheck-disabled-checkers '(javascript-jshint)))
 (flycheck-add-mode 'javascript-eslint 'web-mode)

 ;; solution for using local eslint?!
 (defun my/use-eslint-from-node-modules ()
   (let* ((root
           (locate-dominating-file
            (or (buffer-file-name) default-directory) "node_modules"))
          (eslint
           (and root
                (expand-file-name "node_modules/eslint/bin/eslint.js"
                                  root))))
     (when (and eslint (file-executable-p eslint))
       (setq-local flycheck-javascript-eslint-executable eslint))))
 (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
 (add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

(use-package
 flycheck-golangci-lint
 :straight t
 :hook (go-mode . flycheck-golangci-lint-setup))
