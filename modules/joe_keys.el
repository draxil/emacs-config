;;; General customised keys that don't fit in a particular file somewhere

(global-set-key (kbd "C-c i") 'indent-region)
;; My key before this had a sensible default in emacs, depricate?
(global-set-key (kbd "C-c g") 'goto-line)
;; "go back to where I just was" - Invaluable!
(global-set-key (kbd "C-c b") 'joe-back-to-mark)

;; This uses bind-key* to block epresent stealing our key
(bind-key* "<f12>" 'joe-open-work-now-org)
(global-set-key (kbd "C-<f12>") 'joe-open-work-org)
(global-set-key (kbd "M-<f12>") 'joe-open-liff-org)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c j o") 'joe-org-link-line-to-kill)
(global-set-key (kbd "C-c j l") 'global-linum-mode)
;; OR MORE USEFUL:
(global-set-key (kbd "C-c o s") 'org-store-link)
;; TODO: should not be global
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-set-key (kbd "s-t") 'tab-bar-mode)
(global-set-key (kbd "s-T") 'tab-bar-select-tab-by-name)
(global-set-key (kbd "M-s-t") 'tab-bar-new-tab)
(bind-key* "<f8>" 'notmuch)

;;


