(defun well-planning-anchor ()
  "the anchor point for our planning"
  (encode-time '(0 0 0 27 9 2021 nil nil nil)))

(defun well-date (time)
  ""
  (format-time-string "%Y-%m-%d" time))

(defun well-period ()
  1209600)

(defun well-add-period (time)
  ""
  (time-add time (well-period)))

(defun well-next-planning ()
  "find the next well planning day"
  (well-find-planning (well-planning-anchor) (current-time)))
(defun well-last-planning ()
  "find the last well planning day"
  (well-find-last-planning (well-planning-anchor) (current-time)))

(defun well-find-planning (start now)
  (if (time-less-p (well-add-period start) now) (well-find-planning (well-add-period start) now) (well-add-period start)))

(defun well-find-last-planning (start now)
  (time-subtract (well-next-planning) (well-period)))

(defun test-well-next-planning-from-anchor ()
  ""
  (assert
   (string=
    (well-date (well-find-planning (well-planning-anchor) (well-planning-anchor)))
    "2021-10-11"
    )
   )
  )
(defun test-well-next-planning-from-anchor-plus-one ()
  ""
  (assert
   (string=
    (well-date (well-find-planning (well-planning-anchor) (encode-time '(1 0 0 11 10 2021 nil nil nil))))
    "2021-10-25"
    )
   )
  )

(defun test-well-last-planning-from-anchor-plus-one ()
    ""
  (assert
   (string=
    (well-date (well-find-last-planning (well-planning-anchor) (encode-time '(1 0 0 11 10 2021 nil nil nil))))
    "2021-10-11"
    )
   )
  )

(defun test-well-planning ()
  ""
  ;; could do with one that mocks current-time
  (test-well-next-planning-from-anchor)
  (test-well-next-planning-from-anchor-plus-one)
  (assert (not (string= (well-date (well-next-planning)) "")))
  (test-well-last-planning-from-anchor-plus-one)
  (assert (not (string= (well-date (well-last-planning)) "")))
  )

(defun next-well-planning-org (node)
  (concat (well-date (well-next-planning)) "wellplanning.org")
  )
(defun next-well-planning-title (node)
  (well-planning-title (well-next-planning)
		       ))
(defun well-planning-title (date)
  (concat "Well planning / retro: " (well-date date)))

(defun next-well-planning-template (node)
  (concat "#+title: " (next-well-planning-title node) "\n#+filetags: well well-retro"))
(defun last-well-planning-title ()
  (well-planning-title (well-last-planning))
  )

(defun well-planning-retro ()
  (interactive)
  (org-roam-node-visit (org-roam-node-from-title-or-alias (last-well-planning-title))))
(defun well-planning-retro-next ()
  (interactive)
  (org-roam-node-visit (org-roam-node-from-title-or-alias (well-planning-title (well-next-planning)))))

(defun capture-next-well-planning ()
  (interactive)
  (let ((filetemplate))

    (org-roam-capture- :node (org-roam-node-create)
		       :templates '(
				    ("g" "good - went well" plain "** %?"
				     :if-new (file+head+olp
					      "${next-well-planning-org}"
					      "${next-well-planning-template}"
					      ("good")
					      ))
				     ("b" "bad / problem" plain "** %?"
				     :if-new (file+head+olp
					      "${next-well-planning-org}"
					      "${next-well-planning-template}"
					      ("bad")
					      ))
				     ("l" "lesson" plain "** %?"
				     :if-new (file+head+olp
					      "${next-well-planning-org}"
					      "${next-well-planning-template}"
					      ("lesson")
					      ))

				     ("p" "plan" plain "** %?"
				      :if-new (file+head+olp
					       "${next-well-planning-org}"
					       "${next-well-planning-template}"
					      ("plan")
					      )))
		       )))


