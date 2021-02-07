
;; Useful for using C-x C-x for nav:
(defun spw/exchange-point-and-mark (arg)
  "Exchange point and mark, but reactivate mark a bit less often.

Specifically, invert the meaning of ARG in the case where
Transient Mark mode is on but the region is inactive."
  (interactive "P")
  (exchange-point-and-mark
   (if (and transient-mark-mode (not mark-active))
       (not arg)
     arg)))
(global-set-key [remap exchange-point-and-mark] 'spw/exchange-point-and-mark)
