;;; beginning of disturbance



(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))
(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)
(global-set-key "\C-c\C-k\C-c" 'kmax-copy-from-minibuffer)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))
(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))
(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))

(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)
(global-set-key "\C-c\C-k\C-c" 'kmax-copy-from-minibuffer)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))
(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))
(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))

(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)
(global-set-key "\C-c\C-k\C-c" 'kmax-copy-from-minibuffer)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))
(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))
(global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(ansi-color-for-comint-mode-on)
(global-set-key "\C-x\C-f" 'ffap)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defun kmax-list-freely-assignable-keys ()
 "List those keys which are freely available to be assigned to
 anything, like C-h when used in the middle of a key sequence
 except that it will tell you which letters are available, to
 save time in allocating the keymap"
 (interactive)
 ;; look at the function "describe-key" in
 ;; /usr/share/emacs/22.2/lisp/help.elc

 )

;; write a function which tells you which emacs keys are free at a
;; certain point in the key binding sequence

;; have a parse function which runs sayer on arbitrary documents and
;; produces the parsed result

(defun kmax-library-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text)
 ""
 (kill-buffer (get-buffer-create buffer-name))
 (switch-to-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer))

(defmacro shift (place)
 "Remove and return the head of the list stored in PLACE.
Analogous to (prog1 (car PLACE) (setf PLACE (cdr PLACE))), though more
careful about evaluating each argument only once and in the right order.
PLACE may be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'car 
   (list 'prog1 
    (list 'reverse place) 
    (list 'setq place 
     (list 'reverse 
      (list 'cdr 
       (list 'reverse place))))))))

(defmacro unshift (x place)
 "Insert X at the head of the list stored in PLACE.
Analogous to (setf PLACE (cons X PLACE)), though more careful about
evaluating each argument only once and in the right order.  PLACE may
be a symbol, or any generalized variable allowed by `setf'."
 (if (symbolp place)
  (list 'setq place
   (list 'reverse
    (list 'cons x
     (list 'reverse place))))))

(defun dired-open-file-with-default-application (&optional arg)
 "Open the file with the system wide default application"
 (interactive "P")
 (let ((string
	(or (dired-get-subdir)
	 (mapconcat (function identity)
	  (if arg
	   (cond ((zerop (prefix-numeric-value arg))
		  (dired-get-marked-files))
	    ((consp arg)
	     (dired-get-marked-files t))
	    (t
	     (dired-get-marked-files
	      'no-dir (prefix-numeric-value arg))))
	   (dired-get-marked-files 'no-dir))
	  " "))))
  (kmax-execute-in-background (concat "xdg-open " (shell-quote-argument (concat (dired-current-directory) string))))))

(defun kmax-execute-in-background (command)
 (shell-command (concat "(" command " &)")))

(defun kmax-do-command-on-data-to-file (command data &optional type)
 "Take data, write it to a temp file, then execute command on it"
 (interactive)
 (let* ((temp-file (make-temp-file "kmax"))
	(actual-command (concat command " " temp-file)))
  (write-region data nil temp-file)
  (if (string= type "string")
   (shell-command-to-string actual-command)
   (run-in-shell actual-command))))


(defun w3m-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIX ME
 )

(defun kmax-search-buffers (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffers nil)
       (starting-buffer (current-buffer)))
  
  (dolist (buffer (buffer-list))
   (save-excursion
    (set-buffer buffer)
    (beginning-of-buffer)
    ;;    (see buffer)
    (if (not (not (search-forward search nil t)))
     (push buffer matching-buffers)
     )
    )
   )
  (set-buffer starting-buffer)
  (display-buffer (list-buffers-noselect nil matching-buffers))
  )
 )

(defun kmax-analyze-all-buffers ()
 "Look at all the buffers and index their knowledge, if it hasn't already"
 (interactive)
 
 )

(defun kmax-get-hexcode-for-character ()
 ""
 (interactive)
 
 )

(defun kmax-util-non-empty-list-p (thing)
 (and (listp thing) (> (length thing) 0)))

;; (defun chomp (str)
;;  "Chomp leading and tailing whitespace from STR."
;;  (let ((s (if (symbolp str) (symbol-name str) str)))
;;   (replace-regexp-in-string "\\(^[[:space:]\\n]*\\|[[:space:]\\n]*$\\)" "" s)))

(defun chomp (str)
 ;; from http://www.emacswiki.org/emacs/ElispCookbook
 "..."
 (let ((s (if (symbolp str)(symbol-name str) str)))
  (save-excursion
   (while (and
	   (not (null (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
	   (> (length s) (string-match "^\\( \\|\f\\|\t\\|\n\\)" s)))
    (setq s (replace-match "" t nil s)))
   (while (and
	   (not (null (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
	   (> (length s) (string-match "\\( \\|\f\\|\t\\|\n\\)$" s)))
    (setq s (replace-match "" t nil s))))
  s))

(defun kmax-find-file-at-point (&optional filename)
 (interactive)
 (let* ((file (thing-at-point 'filename)))
  (ffap (chomp (shell-command-to-string (concat "which " file))))))

(defun kmax-util-increase-font-size ()
 ;; find the current font size, and replace with the next one up
 
 )

(defun kmax-util-decrease-font-size ()
 ;; find the current font size, and replace with the next one down
 
 )

(defun kmax-util-set-font-large ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-adobe-courier-bold-*-*-*-34-*-*-*-*-*-*-*")
 )

(defun kmax-util-set-font-small ()
 "Set the font to be large so that the patient can read."
 (interactive)
 (set-default-font "-*courier-medium-r-normal--14-140-*-iso8859-1")
 )

(defun kmax-reopen-last-closed-buffer ()
 "Similar to the 'Reopen Closed Tab' in browsers"
 (interactive)
 ;; we'll have to query the elog system to get this information
 (let*
  (
   (message (uea-query-agent-raw "get-last-closed-buffer" "ELog" "$VAR1 = {_DoNotLog => 1}"))
   (data (nth 5 message))
   (result (shell-command-to-string
	    (concat "/var/lib/myfrdcsa/codebases/internal/unilang/scripts/convert-perl-to-emacs-data.pl "
	     (shell-quote-argument data))))
   (filename (cdr (assoc "Results" (eval (read (concat "'" result))))))
   )
  (find-file filename)
  )
 )

(defun kmax-dired-describe-file-at-point ()
 "use the \"file\" command to extract info appoint the file at point"
 (interactive))

;; (defun kmax-save-buffer-list ()
;;  "FIX ME"
;;  (interactive)
;;  (display-buffer (list-buffers-noselect))
;;  (save-excursion
;;   (switch-to-buffer (get-buffer "*Buffer List*"))
;;   (mark-whole-buffer)
;;   (let* ((buffer-data (buffer-substring-no-properties (point) (mark))))
;;    (message buffer-data)
;;    )))

(defun kmax-w3m-get-current-url ()
 "Get the current url in the echo area"
 (interactive)
 (when w3m-current-url
  w3m-current-url))

(defun kmax-w3m-get-this-url (&optional interactive-p)
 "Get the url under point in the echo area"
 (interactive (list t))
 (let ((url (if interactive-p
	     (or (w3m-anchor) (w3m-image))
	     (or (w3m-anchor (point)) (w3m-image (point))))))
  (when (or url interactive-p)
   (and url interactive-p (kill-new url))
   (or (w3m-url-readable-string url)
    (and (w3m-action) "There is a form")
    "There is no url"))))

(defun kmax-w3m-get-a-url (&optional interactive-p)
 "Get either this or current url and return it"
 (interactive (list t))
 (or (kmax-w3m-get-this-url interactive-p)
  (kmax-w3m-get-current-url)))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that")

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (see (setq debug-on-error (not debug-on-error))))

