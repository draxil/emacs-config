
;; reproduce this from View-back-to-mark which used to be generally available,
;; but now is properly localised to that mode, because I use this on a keybinding to pop through places in buffers see joe_keys.el!
(defun joe-back-to-mark (&optional ignore)
  "Return to last mark, else beginning of file.
Displays line at center of window.  Pops mark ring so successive
invocations return to earlier marks."
  (interactive)
  (goto-char (or (mark) (point-min)))
  (pop-mark)
  (recenter))
