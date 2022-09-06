
;; stolen from prot
;; https://git.sr.ht/~protesilaos/dotfiles/tree/master/item/emacs/.emacs.d/prot-emacs-modules/prot-emacs-search.el#L5
;; effect is you can use search with space meaning .*, toggle a real space search with
;; M-s space
(setq search-whitespace-regexp ".*?")
(setq isearch-lax-whitespace t)
(setq isearch-regexp-lax-whitespace nil)

