(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :diminish 'org-roam-mode
  :custom
  (org-roam-directory "~/Dropbox/org-roam/")
  ; moving the db out of dropbox stops locking issues,
  ; also no need because it's a cache so saves pointless syncs.
  (org-roam-db-location "~/.local/my/org-roam/org-roam.db")
  :config
  (org-roam-setup)
  :bind (
	 ("C-<f9>" . org-roam-node-find)
	 ("<f5>". org-roam-dailies-goto-today)
	 ("M-<f5>". org-roam-dailies-goto-yesterday)
	 :map org-roam-mode-map
	 (("C-c n l" . org-roam)
	  ("C-c n f" . org-roam-node-find)
	  ("C-c n g" . org-roam-graph))
	 :map org-mode-map
	 (("C-c n i" . org-roam-node-insert))
	 (("C-c n I" . org-roam-insert-immediate))
	 ))
