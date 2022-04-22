(use-package projectile
  :straight t
  :init
  (projectile-mode +1)
  :config
  (setq projectile-completion-system 'default)
  (use-package helm-projectile
    :straight t
    )
  :bind
  ( :map projectile-mode-map (
	 ("s-p" . projectile-command-map)
	 )
	 :map projectile-command-map (
 	      ("a" . helm-projectile-ack)
	 )
  )
)
