(use-package
 org-roam
 :straight t
 :commands (org-roam)
 :init (setq org-roam-v2-ack t)
 :diminish 'org-roam-mode
 :custom (org-roam-directory "~/Nextcloud/org-roam/")
 ; moving the db out of dropbox stops locking issues,
 ; also no need because it's a cache so saves pointless syncs.
 (org-roam-db-location "~/.local/my/org-roam/org-roam.db")
 (org-roam-capture-templates
  '(("d" "default" plain "%?"
     :if-new
     (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
     :unnarrowed t)
    ("w" "well project" plain "* Plan\n\n* Tasks\n\n%?"
     :if-new
     (file+head
      "%<%Y%m%d%H%M%S>-${slug}.org"
      "#+title: ${title}\n#+filetags: :welldigital:project:wellproject:")
     :unnarrowed t)))

 :config (org-roam-setup)
 :bind
 (("<f9>" . org-roam-node-find)
  ("M-<f9>" . consult-org-roam-search)
  ("<f5>" . org-roam-dailies-goto-today)
  ("M-<f5>" . org-roam-dailies-goto-yesterday)
  :map
  org-roam-mode-map
  (("C-c n l" . org-roam)
   ("C-c n f" . org-roam-node-find)
   ("C-c n g" . org-roam-graph))
  :map
  org-mode-map
  (("C-c n i" . org-roam-node-insert))
  (("C-c n I" . org-roam-insert-immediate))))

(use-package consult-org-roam :straight t :after (org-roam))
