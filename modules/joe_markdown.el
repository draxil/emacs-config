(use-package markdown-mode
  :bind(
	:map markdown-mode-map
	     ("C-c v" . joe-view-md)
	     ))


(defun joe-view-md ()
  "show md in viewer"
  (interactive)
  (async-start-process "markdown preview" "markdown_previewer" nil (buffer-file-name)))

