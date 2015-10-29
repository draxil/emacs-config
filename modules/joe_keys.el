;;; General customised keys that don't fit in a particular file somewhere

(global-set-key (kbd "C-c i") 'indent-region)
;; My key before this had a sensible default in emacs:
(global-set-key (kbd "C-c g") 'goto-line)
;; "go back to where I just was" - Invaluable!
(global-set-key (kbd "C-c b") 'joe-back-to-mark)
