;; Largely stolen, also some stuff in flycheck. So:
;; TODO decide if it's all for keeps

;; (defun my/activate-tide-mode ()
;;   "Use hl-identifier-mode only on js or ts buffers."
;;   (when (and (stringp buffer-file-name)
;;              (string-match "\\.[tj]sx?\\'" buffer-file-name))
;; 	(tide-setup)
;;   (tide-hl-identifier-mode)))

;; (defun my/set-local-eslint ()
;;   "Use local node_modules."
;;   (add-node-modules-path)
;;   (setq-local flycheck-javascript-eslint-executable (executable-find "eslint")))


(use-package
 tide
 :ensure t
 :after (:any (typescript-mode company flycheck) (web-mode))
 :config
 (flycheck-add-next-checker 'tsx-tide 'javascript-eslint)
 (company-mode +1)
 :hook
 ((typescript-mode . tide-setup)
  (typescript-mode . tide-hl-identifier-mode)
  (web-mode . tide-setup)
  (web-mode. tide-hl-identifier-mode)
  ;(before-save . tide-format-before-save))
  )
 :bind (:map tide-mode-map (("C-c f" . tide-format) ("C-c F" . tide-fix))))

(use-package
 web-mode
 :ensure t
 :commands (web-mode)
 :mode ("\\.ejs\\'" "\\.hbs\\'" "\\.html\\'" "\\.php\\'" "\\.[jt]sx?\\'")
 :config
 (defun my/web-mode-hook ()
   ""
   ;;	 (interactive)
   (setq web-mode-content-types-alist '(("jsx" . "\\.[jt]sx?\\'")))
   (setq web-mode-markup-indent-offset 2)
   (setq web-mode-css-indent-offset 2)
   (setq web-mode-code-indent-offset 2)
   (setq web-mode-script-padding 2)
   (setq web-mode-block-padding 2)
   (setq web-mode-style-padding 2)
   (setq web-mode-enable-auto-pairing 't)
   (setq web-mode-enable-auto-closing 't)
   (setq web-mode-enable-current-element-highlight 't)
   (setq-local indent-tabs-mode nil)
   (setq-local create-lockfiles nil))
 (company-mode +1)
 :hook ((web-mode . my/web-mode-hook)))

(use-package
 jest
 :after (tide-mode)
 :hook (tide-mode . jest-minor-mode))

(use-package add-node-modules-path :ensure t)
