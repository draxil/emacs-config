(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C-S-a C-S-a") 'mc/edit-beginnings-of-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  ;; TODO this one could be in a mc map or something???
  (global-set-key (kbd "C-?") 'mc/unmark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)
  
  )
