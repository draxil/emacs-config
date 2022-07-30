(add-hook 'sql-mode-hook 'lsp)
(setq lsp-sqls-workspace-config-path nil)

(add-hook 'lsp-sqls-after-open-hook
	  (lambda ()
	    (joe-load-secrets)
	    (setq lsp-sqls-connections
		  `(((driver . "postgresql")
		     (dataSourceName .  ,(concat
					  "host=127.0.0.1 port=5433 user=backbone password=" ri-backbone-dev-pwd " dbname=backbone ")))
		    ((driver . "postgresql")
		     (dataSourceName .  "host=127.0.0.1 port=5432 user=injector password=mypassword dbname=injector "))
		    ))
	    (local-set-key (kbd "C-c C-c") 'lsp-sql-execute-paragraph)
	    ))
;; TODO:
;; - not have to lsp restart
;; - perhaps a drop-in include in the lsp module.
