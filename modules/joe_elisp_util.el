;; courtesy of https://www.emacswiki.org/emacs/ElispCookbook
(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (while (string-match "\\`\n+\\|^\\s-+\\|\\s-+$\\|\n+\\'" str)
    (setq str (replace-match "" t t str)))
  str)

(use-package
 elisp-autofmt
 :straight t
 :config
 (setq elisp-autofmt-on-save-p 'always)
 (add-hook 'emacs-lisp-mode-hook 'elisp-autofmt-mode)
 )
