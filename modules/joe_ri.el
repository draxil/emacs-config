(defun ri-planning-anchor ()
  "the anchor point for our planning"
  (encode-time '(0 0 0 23 11 2022 nil nil nil)))

(defun ri-date (time)
  ""
  (format-time-string "%Y-%m-%d" time))

(defun ri-period ()
  1209600)

(defun ri-add-period (time)
  ""
  (time-add time (ri-period)))

(defun ri-next-planning ()
  "find the next ri planning day"
  (ri-find-planning (ri-planning-anchor) (current-time)))
(defun ri-last-planning ()
  "find the last ri planning day"
  (ri-find-last-planning (ri-planning-anchor) (current-time)))

(defun ri-find-planning (start now)
  (if (time-less-p (ri-add-period start) now) (ri-find-planning (ri-add-period start) now) (ri-add-period start)))

(defun ri-find-last-planning (start now)
  (time-subtract (ri-next-planning) (ri-period)))

(defun test-ri-next-planning-from-anchor ()
  ""
  (cl-assert
   (string=
    (ri-date (ri-find-planning (ri-planning-anchor) (ri-planning-anchor)))
    "2022-03-31"
    )
   )
  )
(defun test-ri-next-planning-from-anchor-plus-one ()
  ""
  (cl-assert
   (string=
    (ri-date (ri-find-planning (ri-planning-anchor) (encode-time '(1 0 0 31 3 2022 nil nil nil))))
    "2022-04-14"
    )
   "next anchor plus one"
   )
  )

(defun test-ri-last-planning-from-anchor-plus-one ()
    ""
  (cl-assert
   (string=
    (ri-date (ri-find-last-planning (ri-planning-anchor) (encode-time '(1 0 0 31 3 2022 nil nil nil))))
    "2022-03-17"
    )
   )
  )

(defun test-ri-planning ()
  ""
  ;; could do with one that mocks current-time
  (test-ri-next-planning-from-anchor)
  (test-ri-next-planning-from-anchor-plus-one)
  (cl-assert (not (string= (ri-date (ri-next-planning)) "")))
  (test-ri-last-planning-from-anchor-plus-one)
  (cl-assert (not (string= (ri-date (ri-last-planning)) "")))
  )

(defun next-ri-planning-org (node)
  (concat (ri-date (ri-next-planning)) "riplanning.org")
  )
(defun next-ri-planning-title (node)
  (ri-planning-title (ri-next-planning)
		       ))
(defun ri-planning-title (date)
  (concat "Ri planning / retro: " (ri-date date)))

(defun next-ri-planning-template (node)
  (concat "#+title: " (next-ri-planning-title node) "\n#+filetags: ri ri-retro"))
(defun last-ri-planning-title ()
  (ri-planning-title (ri-last-planning))
  )

(defun ri-planning-retro ()
  (interactive)
  (org-roam-node-visit (org-roam-node-from-title-or-alias (last-ri-planning-title))))
(defun ri-planning-retro-next ()
  (interactive)
  (org-roam-node-visit (org-roam-node-from-title-or-alias (ri-planning-title (ri-next-planning)))))

(defun capture-next-ri-planning ()
  (interactive)
  (let ((filetemplate))

    (org-roam-capture- :node (org-roam-node-create)
		       :templates '(
				    ("g" "good - went ri" plain "** %?"
				     :if-new (file+head+olp
					      "${next-ri-planning-org}"
					      "${next-ri-planning-template}"
					      ("good")
					      ))
				     ("b" "bad / problem" plain "** %?"
				     :if-new (file+head+olp
					      "${next-ri-planning-org}"
					      "${next-ri-planning-template}"
					      ("bad")
					      ))
				     ("l" "lesson" plain "** %?"
				     :if-new (file+head+olp
					      "${next-ri-planning-org}"
					      "${next-ri-planning-template}"
					      ("lesson")
					      ))

				     ("p" "plan" plain "** %?"
				      :if-new (file+head+olp
					       "${next-ri-planning-org}"
					       "${next-ri-planning-template}"
					      ("plan")
					      )))
		       )))


(defun ri-make-pbb-lambda-dirs ()
  (interactive)
  (make-directory "cmd")
  (make-directory "internal")
  (make-directory "internal/handler")
  (make-directory "internal/service"))


(defvar ri-ticket-prefix "SVP" "prefix for a ticket number")

(defun ri-ticket-to-org-link ()
    (interactive)
  (let* ((url (current-kill 0))
	 (ticket (substring url (string-match ri-ticket-prefix url) (length url)))
	 )
    (insert (concat "[[" url "][" ticket "]]"))
    ))

(defun ri-ticket-todo ()
  (interactive)
  (insert "* TODO ")
  (ri-ticket-to-org-link))

(define-minor-mode
  ri-injector-mode
  "minor mode for working on project injector (mostly for snippet triggers)")

(defun ri-inj-run-api ()
  (interactive)
  (if (buffer-live-p (get-buffer "*ri-inj-api*"))
      (kill-buffer "*ri-inj-api*"))
  (async-shell-command "cd `git rev-parse --show-toplevel` && make run/refresh-api && docker logs --tail=1 -f product-injector-api-injector-api-1" "*ri-inj-api*"))

