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
  ("r" (capture-next-ri-planning) "capture planning")
  ("b" (work-branch-menu/body) "new branch")
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
  ("t" (ri-new-service-branch-for-ticket) "ticket")
  ("s" (ri-new-service-branch-support) "support")
  ("q" nil "quit"))

 (defhydra
  work-platform-branch-menu
  (:exit t)
  "
*new platform branch*

"
  ("t" (ri-new-platform-branch-for-ticket) "ticket")
  ("s" (ri-new-platform-branch-support) "support")
  ("q" nil "quit")))
