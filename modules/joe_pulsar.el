(use-package pulsar
  :straight (pulsar :host nil :repo "https://git.sr.ht/~protesilaos/pulsar" :type git :branch "main")
  :config
  (setq pulsar-pulse-functions
	'(recenter-top-bottom
          move-to-window-line-top-bottom
          reposition-window
          forward-page
          backward-page
          scroll-up-command
          scroll-down-command
          org-next-visible-heading
          org-previous-visible-heading
          org-forward-heading-same-level
          org-backward-heading-same-level
          outline-backward-same-level
          outline-forward-same-level
          outline-next-visible-heading
          outline-previous-visible-heading
          outline-up-heading))

  (setq pulsar-pulse t)
  (setq pulsar-delay 0.055)
  (setq pulsar-iterations 10)

  (pulsar-global-mode 1)


  (dolist (hook '(org-mode-hook emacs-lisp-mode-hook))
    (add-hook hook #'pulsar-mode))
  :bind
  ("C-x l" . 'pulsar-pulse-line)
  ("C-c h" . 'pulsar-highlight-dwim))
