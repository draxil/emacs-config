(use-package helm
  :ensure t
  :defer t
  :diminish helm-mode
  :init
  (progn
    (global-set-key (kbd "M-x") #'helm-M-x)
    (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
    (global-set-key (kbd "C-x C-f") #'helm-find-files)
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)
    (global-set-key (kbd "C-x M-b") 'helm-mini)
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (helm-mode 1)
    )
  :config
  (use-package helm-config))
(use-package helm-swoop
  :ensure t
  :defer t
  :bind
  (("C-x c s" . helm-swoop)
   ;; maybe drop the "without-pre-input" if we can adapt to pressing C-k when we dont want it?
   ("M-i" . helm-swoop-without-pre-input)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all))
  :config
  (progn
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
    (add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")
    ;; Move up and down like isearch
    (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
    (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
    (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
    (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
    ))

