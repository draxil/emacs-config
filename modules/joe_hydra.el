(use-package
 hydra
 :straight t
 :config
 (defhydra
  work-menu
  (:exit t)
  "
*work*

"
  ("r" (work-retro-menu/body) "retro / planning")
  ("b" (work-branch-menu/body) "new branch")
  ("c" (capture-work) "capture")
  ("s" (joe-work-view-current-sprint) "current sprint")
  ("m" (joe-my-jira) "my jira tasks")
  ("q" nil "quit"))

 (defhydra
  work-branch-menu
  (:exit t)
  "
*new branch*

"
  ("s" (work-service-branch-menu/body) "service")
  ("p" (work-platform-branch-menu/body) "platform")
  ("q" nil "quit"))

 (defhydra
  work-service-branch-menu
  (:exit t)
  "
*new service branch*

"
  ("m" (ri-new-service-branch-for-my-ticket) "mine")
  ("t" (ri-new-service-branch-for-ticket) "ticket")
  ("s" (ri-new-service-branch-support) "support")
  ("f" (ri-goto-fresh-services-master) "fresh master")
  ("q" nil "quit"))

 (defhydra
  work-platform-branch-menu
  (:exit t)
  "
*new platform branch*

"
  ("m" (ri-new-platform-branch-for-my-ticket) "mine")
  ("t" (ri-new-platform-branch-for-ticket) "ticket")
  ("s" (ri-new-platform-branch-support) "support")
  ("f" (ri-goto-fresh-platform-master) "fresh master")
  ("q" nil "quit")))

(defhydra
 work-retro-menu
 (:exit t)
 "
*retro/planning

Note in SVI want [n] \"next\" on planning day
"
 ("n" (ri-planning-retro-next) "next")
 ("l" (ri-planning-retro) "last")
 ("c" (capture-next-ri-planning) "capture"))
