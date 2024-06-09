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

(add-hook 'go-mode-hook 'copilot-mode)
