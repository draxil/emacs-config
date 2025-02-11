;; Shackle provides control over emacs "windows" and how they open.
(use-package
 shackle
 :straight t
 :init (shackle-mode)
 :config
 (setq
  shackle-rules
  '(("*vertico-buffer*" :align below :popup t)
    ("Vertico" :align below :popup t :regexp t)
    ("*vterm*" :align below :popup t)
    ("*Go Test*" :align below :popup t)
    ("*Gofmt Errors*" :align below :popup t)
    ("magit-diff" :select nil :other t)
    ("Magit:" :same t :regexp t)
    ;; note the space here is how it seems to come out!
    (" *transient*" :align below :popup t)
    ("*Warnings*" :ignore t))
  shackle-default-rule '(:other t)
  shackle-default-align 'right))
