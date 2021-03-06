(use-package helm-projectile
  :init
  (progn
    (helm-projectile-on)
    (projectile-mode +1)
    (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    )
  :diminish projectile-mode
  :bind(
	:map projectile-command-map
	     (
	      ("a" . helm-projectile-ack)
	      )
	)
  )
