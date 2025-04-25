(use-package
 gptel
 :straight t
 :config
 (progn
   (setq gptel-model 'deepseek-r1:latest)
   (setq gptel-backend
         (gptel-make-openai
          "work"
          :host "chat.ri-tech.io"
          :key
          (lambda ()
            (auth-source-pick-first-password
             :host "workai"
             :user "apikey"))
          :models '(gpt-4.1)
          :endpoint "/api/chat/completions"
          :stream 't))
   (setq gptel-expert-commands 't)

   (gptel-make-ollama
    "ollama"
    :host "localhost:11434"
    :stream t
    :models '(deepseek-coder-v2:latest opencoder:latest))))
