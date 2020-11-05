
(use-package vterm-toggle
  :config
  (global-set-key [f2] 'vterm-toggle)
  (global-set-key [C-f2] 'vterm-toggle-cd)
  )

(use-package vterm-mode
  :config
  ; remove f2 from vterm, we want that for toggle
  (define-key vterm-mode-map [f2] nil)
  (define-key vterm-mode-map [(control return)])   #'vterm-toggle-insert-cd
  (define-key vterm-mode-map [f3]) #'describe-mode
  )
