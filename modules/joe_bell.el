;; We don't really want the PC speaker blairing out,
;; but it's nice to have some indicator, thus I go
;; for a variation on the modeline flash, stolen from
;; the emacs wiki:

(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg)))
