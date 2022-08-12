(defun joe-centre-fill ()
  (interactive)
  (visual-fill-column-mode)
  (setq-local visual-fill-column-width 80)
  (setq-local visual-fill-column-center-text 't))
  
