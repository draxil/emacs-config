;; assessing this AI garbage, spoilers: not a fan.

(use-package
 copilot
 :straight
 (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
 :ensure t)

(define-key
 copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
(define-key
 copilot-completion-map (kbd "C-]") 'copilot-next-completion)
(define-key
 copilot-completion-map (kbd "C-[") 'copilot-previous-completion)

(defvar joe-shutup-copilot 't
  "set to stop copilot coming on")

(defun joe-shutup-copilot ()
  "shut up copilot! (you are annoying)"
  (interactive)
  (if (fboundp 'copilot-mode)
      (copilot-mode -1))
  (setq joe-shutup-copilot 't))

(defun joe-wakeup-copilot ()
  "wake up copilot after it's been in the sin-bin"
  (interactive)
  (setq joe-shutup-copilot 'nil)
  (if (fboundp 'copilot-mode)
      (copilot-mode 1)))

;; load copilot for go, but only when it's not been switched off.
(add-hook
 'go-mode-hook
 (lambda ()
   (unless joe-shutup-copilot
     (copilot-mode))))
