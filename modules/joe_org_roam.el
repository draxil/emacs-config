(use-package org-roam
  :init
  ;;  (add-hook 'after-init-hook (org-roam-mode))
  (use-package org-roam-dailies)
  :diminish 'org-roam-mode
  :custom
  (org-roam-directory "~/Dropbox/org-roam/")
  ; moving the db out of dropbox stops locking issues,
  ; also no need because it's a cache so saves pointless syncs.
  (org-roam-db-location "~/.local/my/org-roam/org-roam.db")
  :config
  :bind (
	 ("C-<f9>" . org-roam-find-file)
	 ("<f5>". org-roam-dailies-today)
	 ("M-<f5>". org-roam-dailies-yesterday)
	 :map org-roam-mode-map
	      (("C-c n l" . org-roam)
	       ("C-c n f" . org-roam-find-file)
	       ("C-c n g" . org-roam-graph-show))
	 :map org-mode-map
	 (("C-c n i" . org-roam-insert))
	 (("C-c n I" . org-roam-insert-immediate))
	 ))
