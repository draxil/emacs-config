(use-package
 mastodon
 :straight t
 :defer 2
 :config
 (setq mastodon-instance-url "https://social.linux.pizza")
 (setq mastodon-active-user "draxil"))

(use-package
 mastodon-alt
 :straight
 `(mastodon-alt :type git :host github :repo "rougier/mastodon-alt")
 :after mastodon
 :config (mastodon-alt-tl-activate))
