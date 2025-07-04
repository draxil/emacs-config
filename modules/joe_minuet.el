(use-package
 minuet
 :straight t
 :bind (("C-c a" . #'minuet-complete-with-minibuffer))

 :config (setq minuet-provider 'openai-compatible)
 (plist-put
  minuet-openai-compatible-options
  :api-key
  (lambda ()
    (auth-source-pick-first-password :host "workai" :user "apikey")))
 (plist-put
  minuet-openai-compatible-options
  :end-point "https://chat.ri-tech.io/api/chat/completions")
 (plist-put minuet-openai-compatible-options :model "gpt-4o-mini"))
