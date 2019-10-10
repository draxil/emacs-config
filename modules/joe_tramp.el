(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(if (fboundp 'tramp-change-syntax)
			     (tramp-change-syntax 'simplified)))
