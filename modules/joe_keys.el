;;; General customised keys that don't fit in a particular file somewhere

(global-set-key (kbd "C-c i") 'indent-region)
;; My key before this had a sensible default in emacs, depricate?
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "M-g g") 'avy-goto-line)
;; TODO: workout how to get this to not do all frames on THIS one maybe??
(global-set-key (kbd "M-g M-w") 'avy-goto-word-0)
;; "go back to where I just was" - Invaluable!
(global-set-key (kbd "C-c b") 'joe-back-to-mark)

;; This uses bind-key* to block epresent stealing our key
(bind-key* "<f12>" 'joe-open-work-now-org)
(global-set-key (kbd "C-<f12>") 'joe-open-work-org)
(global-set-key (kbd "M-<f12>") 'joe-open-liff-now-org)
(bind-key "C-c <f12>" 'joe-open-liff-org)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c j o") 'joe-org-link-line-to-kill)
(global-set-key (kbd "C-c j l") 'global-linum-mode)
;; toggle indent guides on & off
(global-set-key (kbd "C-c j i") 'highlight-indent-guides-mode)
(global-set-key (kbd "C-c o s") 'org-store-link)
;; TODO: should not be global
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-set-key (kbd "s-t") 'tab-bar-mode)
(global-set-key (kbd "s-T") 'tab-bar-select-tab-by-name)
(global-set-key (kbd "M-s-t") 'tab-bar-new-tab)
(bind-key "<f8>" 'notmuch)
(bind-key "<f4>" 'ace-window)
(bind-key "C-'"  'avy-goto-char-2)

(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)

(global-set-key (kbd "M-S-<down>") 'shrink-window)
(global-set-key (kbd "M-S-<up>") 'enlarge-window)
(global-set-key (kbd "C-c C-j") 'joe/body)
(global-set-key (kbd "C-c j t") 'treemacs)
(global-set-key (kbd "C-c c r") 'consult-ripgrep)
(global-set-key (kbd "C-c c a") 'consult-apropos)
(global-set-key (kbd "C-c c l") 'consult-line)
(global-set-key (kbd "C-c c L") 'consult-line-multi)
(global-set-key (kbd "C-c c m") 'consult-mark)
(global-set-key (kbd "C-c c g") 'consult-register)
(bind-key "C-c f"  'fontaine-set-preset)
(bind-key "C-c j j" 'ace-window)
;; for when we explicitly don't want it in our kill ring
(bind-key "C-S-w" 'delete-region)

;; for when we want eshell powers, perhaps make it pop like vterm at some point?
(bind-key "M-<f2>" 'eshell)

; on trial
(global-set-key (kbd "<f6>")
		(lambda ()
		  (interactive)
		  (jump-to-register ?0)))
(global-set-key (kbd "M-<f6>")
		(lambda ()
		  (interactive)
		  (point-to-register ?0)))
