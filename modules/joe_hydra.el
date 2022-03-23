(use-package hydra
  :straight t
  :config
  (defhydra joe ()
    "
*joe menu*

_r_ - retro capture  _l_ bigger
^ ^                  _k_ smaller   _q_ - close
"
    ("r" (ri-planning-retro)  )
    ("l" text-scale-increase )
    ("k" text-scale-decrease )
    ("q" nil)
  ))
