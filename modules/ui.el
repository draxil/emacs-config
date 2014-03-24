

; from my old .emacs should redo this in a more suitable way, see sdenna's setup and use themes?
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(cursor ((t (:stipple nil :background "green" :foreground "green" :inverse-video t)))))

;; Remove uncessary UI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode -1)
(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)

;; modeline:
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)