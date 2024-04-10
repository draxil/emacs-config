;; Password menu is a useful way to use emacs as a password manager!
;; not on straight, just because it didn't work out of the box 🤷‍♂️, so
;; move it at some point when that seems sensible!  Not hyper secure
;; as it goes through the clipboard, so don't give it the crown
;; jewels, but it's not bad for every day stuff, and does scrub from
;; emacs kill ring at least.
(use-package password-menu
  :ensure t
  :bind
  ("C-c j p" . password-menu-completing-read))

