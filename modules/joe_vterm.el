
(use-package
 vterm-toggle
 :straight t
 :bind
 ("<f2>" . 'vterm-toggle)
 ("C-<f2>" . 'vterm-toggle-cd))

(use-package
 vterm
 :after vterm-toggle
 :straight t
 :config
 ; remove f2 from vterm, we want that for toggle
 (define-key vterm-mode-map [f2] nil)
 (define-key
  vterm-mode-map [(control return)] 'vterm-toggle-insert-cd)
 (define-key vterm-mode-map [f3] 'describe-mode))
