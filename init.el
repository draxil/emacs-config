;; Emacs configuration entry point

;; Adapted from stevendanna's emacs-config
;; https://github.com/stevendanna/emacs-config

(add-hook
 'emacs-startup-hook
 (lambda ()
   (message "Emacs ready in %s with %d garbage collections."
            (format "%.2f seconds"
                    (float-time
                     (time-subtract
                      after-init-time before-init-time)))
            gcs-done)))


;; get straight sorted first:
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent
         'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)
(straight-use-package 'org)


;; load vendor and custom files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")
(defvar vendor-dir (concat emacs-dir "vendor/")
  "Packages not yet available in ELPA")
(defvar my-package-dir (concat emacs-dir "my-packages/")
  "My packages")

(defvar module-dir (concat emacs-dir "modules/")
  "Where the real configuration happens")

(setq gc-cons-threshold (* 50 1000 1000))

;; add to load path
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path module-dir)
(add-to-list 'load-path my-package-dir)

;; Do use-package before modules
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(require 'package)
(add-to-list
 'package-archives '("melpa" . "https://melpa.org/packages/")
 '("elpa" . "https://elpa.gnu.org/packages/"))


(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar bootstrap-version)

;; require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
(server-start)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq gc-cons-threshold (* 2 1000 1000))
