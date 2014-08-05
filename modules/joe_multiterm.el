(when (require 'multi-term nil 'noerror) 

  (setq multi-term-program "/bin/bash")  

  (global-set-key (kbd "C-c t") 'multi-term-next)
  (global-set-key (kbd "C-c T") 'multi-term) ;; create a new one
)
