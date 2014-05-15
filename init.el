;; Emacs configuration entry point

;; Adapted from stevendanna's emacs-config
;; https://github.com/stevendanna/emacs-config

(require 'package)

(add-to-list 'package-archives
'("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(magit cperl-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load vendor and custom files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")
(defvar vendor-dir (concat emacs-dir "vendor/")
  "Packages not yet available in ELPA")
(defvar module-dir (concat emacs-dir "modules/")
  "Where the real configuration happens")

;; add to load path
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path module-dir)

;; require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
(server-start)

(put 'upcase-region 'disabled nil)
