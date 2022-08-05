
;; Remove uncessary UI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; trying the fringes again? 
;(fringe-mode -1)
(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)

;; modeline:
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
;; TODO: use themes, remove the stuff from custom?

(setq use-dialog-box nil)

;; TODO: less crude window management, but:
;; I basically never want a vertical split
;; And if I do I'll C-x 3
(setq
   split-width-threshold 9999999999
   split-height-threshold 0)
