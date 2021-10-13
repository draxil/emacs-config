(defun well-planning-anchor ()
  "the anchor point for our planning"
  (encode-time '(0 0 0 27 9 2021 nil nil nil)))

(defun well-date (time)
  ""
  (format-time-string "%Y-%m-%d" time))

(defun well-add-period (time)
  ""
  (time-add time 1209600))

(defun well-next-planning (&optional in)
  "find the next well planning day"
  (unless in (setq in (well-planning-anchor)))
    
  (if (time-less-p (well-add-period in) (current-time)) (well-next-planning (well-add-period in)) (well-add-period in))
  )

(defun test-well-next-planning-from-anchor ()
  ""
  (assert
   (string=
    (well-date (well-next-planning (well-planning-anchor)))
    "2021-10-11"
    )
   )
  )
(defun test-well-next-planning-from-anchor-plus-one ()
  ""
  (assert
   (string=
    (well-date (well-next-planning
		(encode-time '(0 0 0 11 10 2021 nil nil nil))
				    ))
    "2021-10-25"
    )
   )
  )

(defun test-well-planning ()
  ""
  ;; could do with one that mocks current-time
  (test-well-next-planning-from-anchor)
  (test-well-next-planning-from-anchor-plus-one)
  )

(defun next-well-planning-org (node)
  (concat (well-date (well-next-planning)) "wellplanning.org")
  )
(defun next-well-planning-title (node)
  (concat "Well planning / retro: " (well-date (well-next-planning)))
  )
(defun next-well-planning-template (node)
  (concat "#+title: " (next-well-planning-title node) "\n#+filetags: well well-retro"))


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

;; ALSOTODO: need "last" version or similiar to find the actual one on the day
