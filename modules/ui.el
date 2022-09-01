
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

;; we don't want dialog boxes
(setq use-dialog-box nil)

(defun joe-load-default-theme ()
  (interactive)
  (load-theme 'ef-autumn :no-confirm))

(defun joe-load-light-theme ()
  (interactive)
  (load-theme 'ef-day :no-confirm))


;; mixed pitch to allow buffers like org-mode to display variable
;; pitch where it makes sense and fixed in things like code blocks
(use-package mixed-pitch
  :straight t
  :hook
  (text-mode . mixed-pitch-mode))

;; fontaine gives us easy font control and preset switching
(use-package fontaine
  :straight t
  :config
  (setq fontaine-presets
      '((regular
         :default-height 100)
        (medium
         :default-weight semilight
         :default-height 140)
        (large
         :default-weight semilight
         :default-height 180
         :bold-weight extrabold)
	(presentation
         :default-weight semilight
         :default-height 200
         :bold-weight extrabold)
        (t ; our shared fallback properties
         :default-family "Hack"
         :default-weight normal
         :variable-pitch-family "Iosevka Aile"
         :variable-pitch-height 1.05)))
  (fontaine-set-preset 'regular))

;; ef-themes are nice colour themes that tie in to lots of emacs stuff nicely
(use-package ef-themes
  :straight (ef-themes :host nil :repo "https://git.sr.ht/~protesilaos/ef-themes" :type git :branch "main")
  :config
  ;; TODO more from https://protesilaos.com/emacs/ef-themes

  ;; Make customisations that affect Emacs faces BEFORE loading a theme
  ;; (TODO) look at prots config in this chunk.

  (setq ef-themes-to-toggle '(ef-autumn ef-deuteranopia-dark))

  ;; Disable all other themes to avoid awkward blending:
  (mapc #'disable-theme custom-enabled-themes)
  (joe-load-default-theme)
  )

;; Tabs - we use tabs as a set of "desktops" for switching between window layouts.
;; as such we don't actually want to see a tab line:
(setq tab-bar-show nil)
(setq tab-bar-position nil)
(tab-bar-mode -1)
;; TODO: steal more of prot's ideas here?
