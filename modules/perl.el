(mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))

(add-hook 'cperl-mode-hook '(lambda ()
   (local-set-key (kbd "RET") 'newline-and-indent)
   (setq cperl-indent-parens-as-block t)
   (setq fill-column 78)
   (setq auto-fill-mode t)
   (setq cperl-indent-level 4)
   (setq cperl-close-paren-offset -4)
   (setq cperl-continued-statement-offset 0)
   (setq cperl-indent-parens-as-block t)
   (setq require-final-newline (quote ask))
   (auto-fill-mode)
   (setq indent-tabs-mode nil)
   (defun perltidy-region ()
    "Run perltidy on the current region."
    (interactive)
    (save-excursion
      (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
   (defun perltidy-defun ()
     "Run perltidy on the current defun."
     (interactive)
     (save-excursion (mark-defun)
		     (perltidy-region)))
   (defun perltidy-as-required ()
     "Rub perltidy on the current region if set otherwise on the current defun"
     (interactive)
     (if mark-active (perltidy-region) (perltidy-defun)))

   ;; bind C-c t to tidy sensibly based on current context
   (local-set-key (kbd "C-c t") 'perltidy-as-required)
   ))
