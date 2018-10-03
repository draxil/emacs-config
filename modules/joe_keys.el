;;; General customised keys that don't fit in a particular file somewhere

(global-set-key (kbd "C-c i") 'indent-region)
;; My key before this had a sensible default in emacs:
(global-set-key (kbd "C-c g") 'goto-line)
;; "go back to where I just was" - Invaluable!
(global-set-key (kbd "C-c b") 'joe-back-to-mark)
(global-set-key (kbd "<f12>") 'joe-open-work-now-org)
(global-set-key (kbd "C-<f12>") 'joe-open-work-org)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
