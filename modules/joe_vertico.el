;; Enable vertico
(use-package vertico
  :straight t
  :init
  (vertico-mode)

  ;; I want the exensions available..
  (add-to-list 'load-path (concat emacs-dir "straight/repos/vertico/extensions/"))

  ;; Needed for completion at point
  (setq completion-in-region-function
      (lambda (&rest args)
        (apply (if vertico-mode
                   #'consult-completion-in-region
                 #'completion--in-region)
               args)))

  ;; This enables consults enhanced competing read multiple.
  ;; honestly I'm not sure I'm getting any use of this yet?
  (advice-add #'completing-read-multiple
              :override #'consult-completing-read-multiple)

  ;; workaround for notmuch tag issue
  (advice-add #'notmuch-read-tag-changes :filter-return (lambda (x) (mapcar #'string-trim x)))
  
  
  ;; Grow and shrink the Vertico minibuffer
  ;;   (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
   (setq vertico-cycle t)
  :bind
  ("M-y" . consult-yank-from-kill-ring)
  ("M-o" . joe/orderless-no-split)
  )

;; Optionally use the `orderless' completion style. See
;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; dispatcher. Additionally enable `partial-completion' for file path
;; expansion. `partial-completion' is important for wildcard support.
;; Multiple files can be opened at once with `find-file' if you enter a
;; wildcard. You may also give the `initials' completion style a try.
(use-package orderless
  :straight t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch))
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))
					(buffer (styles basic))
					)))

;; HACKY! couldn't quickly solve this so split on literal tab
;; instead, gets what I want from this. But TODO better.
;; ALSO TODO: doesn't work on ripgrep.
(defun joe/orderless-no-split ()
  "For the rest of the session match spaces"
  (interactive)
  (setq-local orderless-component-separator "	"))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; TODO: moveme?
;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(use-package vertico-buffer
  :after vertico
  :init
  (load-library "vertico-buffer")
  (vertico-buffer-mode))

;; temporarily replaced by vertico buffer, see how we feel?
;; vertico in a posframe, unless we're not in X.
;;(if (window-system)
    ;; (use-package vertico-posframe
    ;; :after vertico
    ;; 	:straight `(vertico-posframe :type git :host github :repo "tumashu/vertico-posframe")
    ;; 	:init
    ;; 	(vertico-posframe-mode)
    ;; 	(setq vertico-posframe-truncate-lines nil))
;;    )
