
;; https://emacs.stackexchange.com/questions/17984/how-to-change-mode-line-color-based-on-host

(defvar my-remote-buffer-colors
  (let ((colors '(;;("red" "darkred")
                  ("green" "darkgreen")
                  ("blue" "darkblue")
                  ("orange" "firebrick"))))
    (setcdr (last colors) colors)
    colors)
  "Cyclic list of color combos to use for remote files. 
Elements are in the form: (active-background-color inactive-background-color).")

(defvar my-assigned-remote-colors (make-hash-table :test 'equal)
  "Hash table pairing remote hosts to mode-line color overrides.")


;;; MY OVERRIDES!
(puthash "/ssh:pedev@ivorsaa7:" '("red" "darkred") my-assigned-remote-colors)



(defvar-local my-assigned-remote-color-cookies nil
  "Stores the face remap cookies created by `my-maybe-assign-remote-color' for removal if necessary.")

(defun my-maybe-assign-remote-color ()
  "If newly found file is remote assign it new modeline colors.

Colors are taken from `my-remote-buffer-colors', every file on the same remote
host will have the same colors, each newly accessed remote host will be assigned a new
color cycled from `my-remote-buffer-colors'."
  (let ((remote (file-remote-p default-directory)))
    (when remote
      (let ((color (or (gethash remote my-assigned-remote-colors) 
                       (puthash remote (pop my-remote-buffer-colors) my-assigned-remote-colors))))
        (setq my-assigned-remote-color-cookies
              (list (face-remap-add-relative 'mode-line (list :background (car color)))
                    (face-remap-add-relative 'mode-line-inactive (list :background (cadr color)))))))))

(add-hook 'find-file-hook 'my-maybe-assign-remote-color)
(add-hook 'dired-mode-hook 'my-maybe-assign-remote-color)
