
(define-minor-mode joe-centre-fill-mode
  "minor mode to do center and fill"
  :init-value nil
  (progn
    (visual-fill-column-mode 'toggle)
    (setq-local visual-fill-column-width 80)
    (setq-local visual-fill-column-center-text 't)))
