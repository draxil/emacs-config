;;; package --- My size modes

(defun joe-enbiggen ()
  (interactive)
  (set-face-attribute 'default nil :height 120)
  )
(defun joe-enbiggish ()
  (interactive)
  (set-face-attribute 'default nil :height 110)
  )
(defun joe-ennormal ()
  (interactive)
  (set-face-attribute 'default nil :height 100)
  )
(defun joe-enmassive ()
  (interactive)
  (set-face-attribute 'default nil :height 150)
  )
(defun joe-enhugen ()
  (interactive)
  (set-face-attribute 'default nil :height 200)
  )
