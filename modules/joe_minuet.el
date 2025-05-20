
(defun joe-minuet-use-work-ai ()
  (interactive)
  "Use the work AI for minuet suggestions"
  (setq minuet-provider 'openai-compatible)
  (plist-put
   minuet-openai-compatible-options
   :api-key
   (lambda ()
     (auth-source-pick-first-password :host "workai" :user "apikey")))
  (plist-put
   minuet-openai-compatible-options
   :end-point "https://chat.ri-tech.io/api/chat/completions")
  (plist-put minuet-openai-compatible-options :model "gpt-4o-mini")
  (setq minuet-context-window 16000))

(defun joe-minuet-use-qwen ()
  (interactive)
  "Use local qwen for minuet suggestions"
  (setq minuet-provider 'openai-fim-compatible)
  (plist-put
   minuet-openai-fim-compatible-options
   :end-point "http://localhost:11434/v1/completions")
  (plist-put
   minuet-openai-fim-compatible-options
   :model "qwen2.5-coder:3b")
  (setq minuet-context-window 512)
  (plist-put minuet-openai-fim-compatible-options :api-key "TERM")
  (minuet-set-optional-options
   minuet-openai-fim-compatible-options
   :max_tokens 56))

(use-package
 minuet
 :straight
 (minuet-ai.el
  :type git
  :host github
  :repo "milanglacier/minuet-ai.el")
 :bind (("C-c a" . #'minuet-complete-with-minibuffer))
 :config (joe-minuet-use-qwen))
