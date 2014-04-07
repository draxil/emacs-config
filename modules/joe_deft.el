(when (require 'deft nil 'noerror) 
   (setq
      deft-extension "org"
      deft-directory "~/Dropbox/org/deft/"
      deft-text-mode 'org-mode)
   (global-set-key (kbd "<f9>") 'deft))
