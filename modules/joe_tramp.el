(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(if (fboundp 'tramp-change-syntax)
			     (tramp-change-syntax 'simplified)))
(eval-after-load 'tramp '(custom-set-variables  '(tramp-remote-path
   (quote
    ("/usr/local/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin" "/usr/local/bin")))))
