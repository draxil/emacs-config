
(defvar rinj-ginkgo-extra-focus "")
(defun rinj-ginkgo ()
  (interactive)
  (let ((command (format "ginkgo-make-helper %s %s %s" ginkgo-flags (rinj-calc-args) (pwd))))
    (message command)
    (async-shell-command command "*rinj-ginkgo*")
    ))
(defun rinj-calc-args ()
  (if (string= rinj-ginkgo-extra-focus "")
      ""
      (format "--focus \"%s\"" (shell-quote-argument rinj-ginkgo-extra-focus))))


(defun rinj-set-extra-focus (focus)
  (interactive "sFOCUS: ")
  (setq-local rinj-ginkgo-extra-focus focus)
  )

(defun rinj-clear-extra-focus ()
  (interactive)
  (setq-local rinj-ginkgo-extra-focus "")
  )

(defun rinj-current-extra-focus ()
  (interactive)
  (message rinj-ginkgo-extra-focus)
  )


;; (define-transient-command rinj-test-menu ()
;;   "RI Injector Test"
;;   ["Tags"
;;    ("-i" "integratrion" "--tags=integration")
;;    ("-u" "unit" "--tags=unit")
;;    ]
;;   ["Actions"
;;    ("t" "run ginkgo test" rinj-ginkgo)]
;;   )

;; (rinj-test-menu)
