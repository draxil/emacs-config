(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(epresent-mode-line '(:eval nil))
 '(git-identity-list 'nil)
 '(notmuch-saved-searches
   '((:name "new" :query "tag:inbox and tag:unread" :key "n")
     (:name "inbox" :query "tag:inbox" :key "i")
     (:name "unread" :query "tag:unread" :key "u")
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "t")
     (:name "drafts" :query "tag:draft" :key "d")
     (:name "all mail" :query "*" :key "a")))
 '(org-log-into-drawer t)
 '(org-modules
   '(org-habit org-checklist org-expiry org-notify org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-mouse))
 '(package-selected-packages
   '(notmuch org-mime htmlize dumb-jump which-key helm-themes haskell-mode vterm-toggle vterm org-roam pomidor json-mode git-identity oauth2 request websocket el-get slack ql helm-swoop csv-mode kotlin-mode doom-modeline toml-mode restclient cargo flymake-rust flycheck-rust rust-mode use-package multiple-cursors diminish counsel ivy helm-projectile helm projectile pomodoro ack org-pomodoro cl-lib-highlight sane-term move-text go-scratch go-playground web-mode org-bullets ## magit-find-file gradle-mode yaml-mode tidy smart-mode-line sauron s perlcritic perl6-mode multi-term markdown-mode magit ido-ubiquitous go-mode gist full-ack deft android-mode alert))
 '(safe-local-variable-values '((org-todo-keyword-faces ("BOUGHT" . "orange"))))
 '(sml/theme 'dark)
 '(smtpmail-smtp-server "office.printevolved.co.uk")
 '(smtpmail-smtp-service 25)
 '(tramp-remote-path
   '("/usr/local/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin" "/usr/local/bin")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(cursor ((t (:stipple nil :background "green" :foreground "green" :inverse-video t))))
 '(epresent-heading-face ((t (:inherit variable-pitch :underline nil :weight bold :height 270)))))
