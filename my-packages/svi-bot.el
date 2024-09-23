;;; svi-bot.el -- interact with the SVI bot


;;; Commentary:

;; Run SVI bot commands, e.g. complete receive.

(require 'plz)

(defun svi--endpoint-manifest ()
  (concat svi-bot-baseurl "/api/v1/manifest/complete"))

(defun svi--endpoint-carton ()
  (concat svi-bot-baseurl "/api/v1/carton/complete"))

(defun svi--endpoint-carton-status ()
  (concat svi-bot-baseurl "/api/v1/carton/status"))

(defun svi--endpoint-manifest-status ()
  (concat svi-bot-baseurl "/api/v1/manifest/status"))


(defun svi-complete-receive-manifest ()
  "Complete receive a manifest with the bot API."
  (interactive)
  (when (not (boundp 'joe-secrets))
    (joe-load-secrets))
  (svi--call-bot (svi--endpoint-manifest) (svi--manifest-body)))

(defun svi-complete-receive-cartons (b e)
  "Complete receive cartons with the bot API, takes carton list from selected region or buffer."
  (interactive "r")
  (when (not (boundp 'joe-secrets))
    (joe-load-secrets))
  (svi--call-bot (svi--endpoint-carton) (svi-cartons-body b e)))

(defun svi-manifest-status (id)
  "Complete receive a manifest with the bot API."
  (interactive "sManifestid: ")
  (when (not (boundp 'joe-secrets))
    (joe-load-secrets))
  (svi--call-bot
   (concat (svi--endpoint-manifest-status) "?id=" id) nil
   'get))


(defun svi-cartons-status (b e)
  "Check status (B E beginning and end of region) or for the selected region interactively."
  (interactive "r")
  (when (not (boundp 'joe-secrets))
    (joe-load-secrets))

  ;;TODO tabular mode display
  (svi--call-bot
   (svi--endpoint-carton-status) (svi-cartons-body b e)))

(defun svi--manifest-body ()
  `(("manifestIds" . (,(read-string "Manifest ID: ")))))

(defun svi-cartons-body (b e)
  `(("cartonIds" .
     ,(coerce
       (seq-filter
        (lambda (s) (not (equal s "")))
        (split-string (if (use-region-p)
                          (buffer-substring b e)
                        (buffer-string))
                      "\n"))
       'array))))

(defun svi--call-bot (endpoint body &optional method)
  "call the SVI bot API"
  (when (not (boundp 'joe-secrets))
    (joe-load-secrets))
  (let ((plz-method
         (if method
             method
           'post)))

    (if body
        (plz
         plz-method endpoint
         :headers
         `(("Authorization" . ,(svi--bot-auth))
           ("Content-Type" . "application/json"))
         :body (json-encode body)
         :as #'json-read
         :then (lambda (alist) (message "OK I guess %s" alist))
         :else 'svi--bot-error)
      (plz
       plz-method
       endpoint
       :headers `(("Authorization" . ,(svi--bot-auth)))
       :as #'json-read
       :then (lambda (alist) (message "OK I guess %s" alist))
       :else 'svi--bot-error))))

(defun svi--request-bot-auth ()
  (plz
   'post
   svi-auth0-endpoint
   :headers '(("Content-type" . "application/json"))
   :body (svi--bot-auth-body)
   :as #'json-read))

(defun svi--bot-auth ()
  "get an auth token for SVI bot API"
  (format "Bearer %s"
          (alist-get 'access_token (svi--request-bot-auth))))

(defun svi--bot-auth-body ()
  (json-encode
   `(("client_id" . ,svi-bot-clientid)
     ("client_secret" . ,svi-bot-client-secret)
     ("audience" . ,svi-bot-audience)
     ("grant_type" . "client_credentials"))))


(defun svi--bot-error (err)
  (message "prs: %s" (plz-response-status (plz-error-response err)))
  (let ((response (plz-error-response err))
        (status (plz-response-status (plz-error-response err))))
    (cond
     ((equal status 401)
      (message "bad request %s"
               (plz-response-body (plz-error-response response))))
     ((equal status 404)
      (message "not found"))
     ('t
      (message "failed: %s %s" status response)))))

(provide 'svi-bot)
