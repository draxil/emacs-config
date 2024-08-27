;;; one-time-secret.el - interact with onetimesecret.com -*- lexical-binding: t -*-

(require 'plz)
;; replace request:
(require 'url-util)

;;; Commentary:

;;; Generate secrets to share, and retrieve them, maybe?
;;; See https://onetimesecret.com/docs/api

;;; TODO this is not very releasable yet but useful for me!

;;; Code:

(require 'plz)
(require 'auth-source)


(defvar onetimesecret-default-ttl (* 60 60 48)
  "Default time to live in seconds.")

(defun ots--api-url (path)
  "Make a onetimesecret.com address, with PATH as the api path."
  (interactive)
  (concat "https://onetimesecret.com/api/v1/" path))


(defun ots--make-request (method path &optional body)
  "Make a oneetimesecret.com request.
METHOD - an HTTP verb
PATH - within oneetimesecret.com
BODY - optional request body"

  ;; TODO: error handling
  (plz
   method
   (ots--api-url path)
   :headers (ots--headers)
   :as #'json-read
   :body body))

(defun ots--key ()
  "Build onetimesecret key."
  (let* ((details (auth-source-user-and-password "onetimesecret.com"))
         (user (pop details))
         (pass (pop details)))
    (cond
     ((or (null pass) (null user))
      (error
       "Incomplete onetimesecret.com auth details, please check the docs for how to configure."))
     (t
      (concat
       "Basic " (base64-encode-string (concat user ":" pass)))))))

(defun ots--headers ()
  "Build headers for an ots request."
  `(("Authorization" . ,(ots--key))))

(defun onetimesecret-check ()
  "Check onetimesecret.com is working/up."
  (interactive)
  (message (alist-get 'status (ots--make-request 'get "status"))))

(defun onetimesecret-share (secret &optional password)
  "Share a secret with interactve prompt.
When used non-interactively SECRET and optional PASSWORD are
used.  Puts secret URL in the kill ring / clipboard"
  (interactive (ots--interactive-share-args 't nil))
  (kill-new (ots--share secret nil password))
  (message "new secret URL ready to yank/paste"))

(defun onetimesecret-share-region (start end &optional password)
  "Share the current region text as a onetimesecret.
If you supply the universal
argument/prefix (\\[universal-argument]) you can provide a
password to guard the secret.  Puts the secret URL in the kill
ring / clipboard.  If called non-interactively START and END are
the bounds of the region and PASSWORD sets the optional
passphrase."
  (interactive (ots--interactive-share-args nil nil))
  (kill-new (ots--share (buffer-substring start end) nil password))
  (message
   "new secret URL
ready to yank/paste"))

(defun onetimesecret-send (secret email &optional password)
  "Send a
secret via email."
  (interactive (ots--interactive-share-args 't 't))
  (ots--share secret email password))

(defun onetimesecret-send-region (start end email &optional password)
  "Send the current region text as a onetimesecret.
Puts the secret URL in the kill ring / clipboard.  If you supply
the universal argument/prefix (\\[universal-argument]) you can
provide a password to guard the secret.  If called
non-interactively START and END are the bounds of the region,
EMAIL is the email address to send it to, and PASSWORD sets the
optional passphrase."
  (interactive (ots--interactive-share-args nil 't))
  (ots--share (buffer-substring start end) email password))

(defun ots--interactive-share-args (promptsecret wantemail)
  (let ((s
         (if promptsecret
             (list (read-string "Secret to share: "))
           (list (region-beginning) (region-end))))
        (e
         (when wantemail
           (list (read-string "Email to send it to: "))))
        (p
         (if current-prefix-arg
             (list (read-passwd "Password: "))
           (list nil))))
    (remove nil (append s e p))))


;; TODO opts
(defun ots--share (secret &optional recipient password)
  (let ((req
         (url-build-query-string
          (remove
           nil
           `((secret ,secret)
             ,(when recipient
                `(recipient ,recipient))
             ,(when password
                `(passphrase ,password))
             ;; TODO: options for ttl? default var as well?
             (ttl ,onetimesecret-default-ttl))))))
    (concat
     "https://onetimesecret.com/secret/"
     (alist-get 'secret_key (ots--make-request 'post "share" req)))))

;;; one-time-secret.el ends here
