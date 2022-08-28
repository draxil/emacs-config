
;; Remove uncessary UI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)

;; modeline:
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; TODO: now we are using themes, perhaps weed some stuff from custom?
(use-package "ef-themes"
  :straight t
  :config
  ;; TODO more from https://protesilaos.com/emacs/ef-themes

  ;; Make customisations that affect Emacs faces BEFORE loading a theme
  ;; (TODO) look at prots config in this chunk.

  (setq ef-themes-to-toggle '(ef-autumn ef-deuteranopia-dark))

  ;; Disable all other themes to avoid awkward blending:
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'ef-autumn :no-confirm)

  ;; TODO: think about variable pitch?
  )

;; TODO: fontaine?

(setq use-dialog-box nil)
