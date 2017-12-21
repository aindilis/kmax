(global-set-key "\C-x\C-f" 'kmax-ffap)

;; (global-set-key "\C-c\C-x\C-m" 'dired-open-file-with-default-application)
(global-set-key "\C-c\C-k\C-f\C-f" 'kmax-reopen-last-closed-buffer)
;; (global-set-key "\C-c\C-k\C-f\C-b" 'kmax-get-buffer-file-name-all-modes)
(global-set-key "\C-c\C-k\C-e" 'kmax-toggle-debug-on-error)
(global-set-key "\C-c\C-k\C-a" 'kmax-apropos)
(global-set-key "\C-c\C-k\C-te" 'enriched-mode)
(global-set-key "\C-c\C-k\C-d" 'diff-buffer-with-file)
(global-set-key "\C-c\C-ks" 'kmax-search-buffers)
(global-set-key "\C-c\C-k " 'kmax-condense-whitespace-in-region)
(global-set-key "\C-c\C-kc" 'kmax-toggle-comment-region)
(global-set-key "\C-c\C-k\C-c" 'kmax-copy-from-minibuffer)
(global-set-key "\C-c\C-kup" 'kmax-update-frdcsa-repositories)
(global-set-key "\C-c\C-k\C-r" 'kmax-server-restart)
(global-set-key "\C-c\C-k\C-m" 'kmax-edit-source-of-current-major-mode)
(global-set-key "\C-c\C-k\C-p" 'kmax-list-unset-input-events-for-prefix-key)
(global-set-key "\C-c\C-k\C-l" 'kmax-start-kmax-command-log-mode)
(global-set-key "\C-x\C-k\C-v" 'kmax-browse-current-url-in-firefox)
(global-set-key "\C-xns" 'kmax-new-shell)
(global-set-key "\C-xny" 'kmax-cycle-next-current-major-mode)
(global-set-key "\C-xnY" 'kmax-cycle-previous-current-major-mode)
(global-set-key "\C-c\C-gvc" 'kmax-view-current-html-file)
(global-set-key "\C-c\C-geb" 'kmax-eval-buffer)
(global-set-key "\C-c\C-gri" 'kmax-run-in-shell-autocomplete)
(global-set-key "\C-c\C-gkw" 'keywiz)

(global-unset-key "\C-ck")
(global-set-key "\C-cktf" 'kmax-edit-temp-file)
(global-set-key "\C-cktb" 'kmax-edit-temp-buffer)
(global-set-key "\C-cksf" 'kmax-my-skip-lines-matching-regexp-forward)
(global-set-key "\C-cksb" 'kmax-my-skip-lines-matching-regexp-backward)
(global-set-key "\C-ckit" 'kmax-insert-timestamp)
(global-set-key "\C-ckid" 'kmax-insert-datestamp)
(global-set-key "\C-ckfn" 'kmax-get-buffer-file-name)

;; (global-set-key "" 'kmax-rename-window-uniquely-and-start-new-shell)

;; (global-set-key "\C-c\C-keb" 'kmax-eval-buffer)

;; quick launchers
(global-set-key "\C-c\C-k\C-snl" 'nlu-ghost-buffer)
(global-set-key "\C-c\C-k\C-ssu" 'suppositional-reasoner)
(global-set-key "\C-c\C-k\C-sac" 'academician-search-papers)

(global-set-key "\C-c\C-k\C-o" 'kmax-load-frdcsa-system)

;; FIXME: need new key space for these
(global-set-key "\C-cel" 'kmax-lock)
(global-set-key "\C-ckmc" 'kmax-clean-emacs-backups)
(global-set-key "\C-ckmu" 'kmax-get-unused-key-sequence-completions-for-key-binding-at-point)
(global-set-key "\C-ckmes" 'kmax-insert-kmax-not-yet-implemented)
(global-set-key "\C-ckmtt" 'kmax-tidy-function)
(global-set-key "\C-ckmst" 'kmax-toggle-trace-function-of-function-at-point)
;; (global-unset-key "\C-cekf")
(global-set-key "\C-ckmff" 'kmax-find-function-or-macro)
(global-set-key "\C-ckmk" 'kmax-find-file-that-defines-keybinding)
(global-set-key "\C-ckmg" 'kmax-get-function-that-defines-keybinding)
(global-set-key "\C-ckmK" 'kmax-insert-key-sequence-description)
(global-set-key "\C-ckmp" 'kmax-function-macro-or-special-form-at-point)
(global-set-key "\C-ckmr" 'kmax-search-for-project)
(global-set-key "\C-ckmd" 'kmax-duck-type-object)
(global-set-key "\C-ckmss" 'kmax-find-shell-command)

(global-set-key "\C-ck(" 'kmax-macro-start-macro)
(global-set-key "\C-ck)" 'kmax-macro-end-macro)

(global-set-key "\C-x\M-c\M-butterfly" 'kmax-butterfly)

(global-set-key "\C-cregw" 'kmax-get-wanted-list)
(global-set-key "\C-crega" 'kmax-get-all-list)

(global-set-key "\C-ckmwx" 'kmax-reset-all-kmax-window-configurations)
(global-set-key "\C-ckmws" 'kmax-save-window-configuration)
(global-set-key "\C-ckmwS" 'kmax-reset-all-kmax-window-configurations-and-then-save-window-configuration)
(global-set-key "\C-ckmwl" 'kmax-list-window-configurations)
(global-set-key "\C-ckmwr" 'kmax-restore-window-configuration)

(global-set-key "\M-." 'kmax-find-function-or-macro)
(global-set-key "\C-ckm." 'kmax-find-require)

(global-set-key "\M-L" 'kmax-downcase-first-letter-of-word-and-forward-word)

(setq tool-bar-mode 0)
(setq menu-bar-mode 0)
(ansi-color-for-comint-mode-on)

;; (global-set-key "\C-x\C-f" 'ffap)

(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; (set-default-font "-adobe-courier-medium-r-normal-*-*-80-*-*-*-*-iso8859-1")
;; (set-default-font "-adobe-courier-medium-r-normal-*-*-120-*-*-*-*-iso8859-1")

(defvar kmax-window-configuration-description-hash (make-hash-table :test 'equal))
(defvar kmax-cycle-choice-last nil)

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

(defun kmax-w3m-search (arg)
 ""
 (w3m-search "google" arg))

(defun kmax-util-message-buffer (buffer-name text &optional no-switch)
 ""
 (if (gnus-buffer-exists-p buffer-name)
  (if t
   (progn
    (set-buffer buffer-name)
    (mark-whole-buffer)
    (delete-region (point) (mark))
    )
   (kill-buffer (get-buffer-create buffer-name))))
 (set-buffer (get-buffer-create buffer-name))
 (insert text)
 (beginning-of-buffer)
 (unless no-switch
  (switch-to-buffer (get-buffer buffer-name))))

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

(defun kmax-view-current-html-file ()
 "If the current file is an html file, render it with w3m"
 (interactive)
 ;; FIXME: there is already a function in w3m that does this but after
 ;; looking twice I was unable to find it
 (if (kmax-mode-is-derived-from 'html-mode)
  (let ((filename
	 (if (not (kmax-filename-has-extension buffer-file-name "html?"))
	  (let ((tmp-file (make-temp-file "/tmp/kmax-view-current-html-file-" nil ".html")))
	   (delete-file tmp-file)
	   (shell-command
	    
	    (concat
	     "ln -s "
	     (shell-quote-argument buffer-file-name)
	     " "
	     (shell-quote-argument tmp-file)))
	   tmp-file)
	  buffer-file-name)))
   (w3m-browse-url (concat "file://" filename)))
  (error "Not an html file.")))

(defun kmax-eval-buffer ()
 ""
 (interactive)
 (eval-buffer)
 (message "Done evaluating buffer."))

(add-hook
 'html-mode-hook
 (lambda ()
  (define-key html-mode-map "\C-xw" 'kmax-view-current-html-file)
  ))

;; (defun kmax-search-buffer-names (&optional search))

(defun kmax-search-buffer-file-names (&optional search)
 "Search all buffers for a given text string"
 (interactive)
 (let ((search (or search (read-from-minibuffer "Search: ")))
       (matching-buffer-file-names nil))
  (dolist (buffer (buffer-list))
   (let ((file-name (buffer-file-name buffer)))
    (if file-name
     (if (string-match search file-name)
      (push buffer matching-buffer-file-names)))))
  matching-buffer-file-names))

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

(defun kmax-util-empty-list-p (thing)
 (not (kmax-util-non-empty-list-p thing)))

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

(defun kmax-w3m-get-current-named-anchor ()
 "FIXME: this doesn't work quite right, it can't get <a id='blah' ...>"
 (interactive)
 (let* 
  ((current-url (kmax-w3m-get-current-url)))
  (save-excursion
   (w3m-previous-anchor)
   (while 
    (not 
     (and
      (non-nil (string-match "\#" (w3m-anchor)))
      (string= (substring (w3m-anchor) 0 (length current-url)) current-url)
      ))
    (w3m-previous-anchor))
   (w3m-anchor))))

(defun kmax-browse-current-url-in-firefox ()
 "Browse the current url from w3m in firefox"
 (interactive)
 (if (string= mode-name "w3m")
  (browse-url-firefox (kmax-w3m-get-a-url))))

(defun kmax-list-unset-input-events-for-prefix-key ()
 "After accepting a prefix key, list all unallocated input
 events (e.g. keys) that you could map for that"
 (interactive)
 (describe-unbound-keys 40))

(defun kmax-next-line-that-does-not-contain ()
 "Search forward for a line that lacks the query"
 )

(defun kmax-previous-line-that-does-not-contain ()
 "Search backward for a line that lacks the query"
 )

(defun kmax-file-defining-key (key)
 ""
 (interactive)
 (see (kbd "^A"))
 ;; (boss-search key)
 )

(defun kmax-apropos (&optional arg)
 ""
 (interactive "P")
 (let* ((symbol-tmp (symbol-at-point))
	(pattern (if (or arg (not symbol-tmp))
		 (read-from-minibuffer
		  "Search for symbol (word list or regexp): ")
		  (prin1-to-string symbol-tmp))))
   (apropos pattern)))

(defun kmax-toggle-debug-on-error ()
 "toggle debug-on-error value"
 (interactive)
 (if (see (setq debug-on-error (not debug-on-error)) 0)
  (setq inhibit-debugger nil)))

(defun kmax-copy-from-minibuffer ()
 ""
 (interactive)
 (copy-region-as-kill (minibuffer-prompt-end) (point-max)))

(defun kmax-not-yet-implemented ()
 "Alert the user that the function being developed is not yet implemented"
 (error "Not yet implemented"))

(defun kmax-server-restart ()
 ""
 (interactive)
 (server-force-delete)
 (server-start))

(defun seq (i j &optional step)
 (let* ((list nil)
	(iterator i))
  (while (<= iterator j)
   (unshift iterator list)
   (setq iterator (+ iterator (or step 1))))
  list))

;; find-or-create a function for getting a shell in a particular directory

(defun kmax-reset-all-kmax-window-configurations-and-then-save-window-configuration ()
 ""
 (interactive)
 (kmax-reset-all-kmax-window-configurations)
 (kmax-save-window-configuration))

(defun kmax-reset-all-kmax-window-configurations ()
 ""
 (interactive)
 (kmax-fixme "Replace this with the more serious y-or-n-p")
 (if (y-or-n-p "Go ahead and reset all window configurations?")
  (progn
   ;; (mapcar (lambda (register) (set-register (car register) nil)) (kmax-get-our-register-alist))
   (kmax-unset-unbind-unmake-delete-remove-variable 'register-alist)
   (kmax-unset-unbind-unmake-delete-remove-variable 'kmax-window-configuration-description-hash)
   (kmax-unset-unbind-unmake-delete-remove-variable 'kmax-window-configuration-file-list-hash))))

(defun kmax-list-window-configurations ()
 ""
 (interactive)
 (see (kmax-get-our-register-alist)))

;; (kmax-get-next-free-register)

(defun kmax-save-window-configuration (&optional arg)
 "Put window configuration to register, but prompt rather than
overwrite"
 (interactive "P")
 (if (not
      (and
       (boundp 'register-alist)
       (kmax-util-non-empty-list-p register-alist)))
  (setq register-alist nil))
 (let ((register (kmax-get-next-free-register)))
  (kmax-save-description-of-window-configuration register)))

(defun kmax-get-our-register-alist ()
 ""
 (interactive)
 (let* ((register-list (mapcar #'single-key-description (seq 97 (+ 97 25))))
	(our-register-alist
	 (kmax-grep-list
	  (mapcar
	   (lambda (register)
	    (let ((item (gethash register kmax-window-configuration-description-hash)))
	     (if item (cons register item )))) register-list)
	  #'non-nil)))
  our-register-alist))

;; register-alist

(defun kmax-restore-window-configuration (&optional arg)
 ""
 (interactive "P")
 (let* ((our-register-alist
	 (kmax-get-our-register-alist))
	(description
	 (ido-completing-read
	  "Please select window configuration description: "
	  (sort (kmax-alist-values our-register-alist) #'string-lessp)))
	(register (car (rassoc description our-register-alist))))
  (jump-to-register (string-to-char register))))

(defun kmax-get-next-free-register ()
 ""
 (interactive)
 (let ((register-list (mapcar #'single-key-description (seq 97 (+ 97 25)))))
  (mapcar
   (lambda (key-description) (if (string= key-description (nth 0 register-list)) (pop register-list)))
   (sort (mapcar (lambda (elt) (single-key-description (car elt))) (copy-sequence register-alist)) #'string-lessp))
  (see (nth 0 register-list) 0.1)))

(defun kmax-get-file-list-for-window-configuration ()
 "Since there do not appear to be any hooks relating to burying and
raising buffers, we'll just iterate over them every now and then, and
log any changes"
 (interactive)
 (let* ((desc nil))
  (walk-windows
   (function
    (lambda (w)
     (let* ((file-name (buffer-file-name (window-buffer w))))
      (if (non-nil file-name)
       (push file-name desc))))))
  desc))

(defun kmax-save-description-of-window-configuration (register)
 ""
 (interactive)
 ;; we need to create the hash if the variable is not bound, or if it
 ;; is an empty list
 (if (not (boundp 'kmax-window-configuration-description-hash))
  (setq kmax-window-configuration-description-hash (make-hash-table :test 'equal)))
 (if (not (boundp 'kmax-window-configuration-file-list-hash))
  (setq kmax-window-configuration-file-list-hash (make-hash-table :test 'equal)))
 (puthash
  register
  (read-from-minibuffer (concat "Name of window configuration? (" register "): "))
  kmax-window-configuration-description-hash)
 (puthash
  register
  (see (kmax-get-file-list-for-window-configuration) 0.1)
  kmax-window-configuration-file-list-hash)
 (window-configuration-to-register (string-to-char register)))

(defun kmax-window-configuration-to-register-checking (register &optional auto-approve)
 "Put window configuration to register, but prompt rather than
overwrite"
 (interactive "Window configuration to register: \nP")
 (if (non-nil (get-register register))
  (if (or 
       auto-approve
       (yes-or-no-p
       (concat "Overwrite register " 
	(char-to-string register) "? ")))
   (window-configuration-to-register register)
   (error "Not putting configuration to window"))
  (window-configuration-to-register register)))

(defun kmax-jump-to-register (register &optional delete)
 "Put window configuration to register, but prompt rather than
overwrite"
 (interactive "Window configuration to register: \nP")
 (jump-to-register register)
 (if delete
  (set-register register nil)))

(defun kmax-current-date-yyyymmdd ()
 "Get the current date in YYYYMMDD format"
 (interactive)
 (let* ((string (shell-command-to-string "date \"+%Y%m%d\"")))
  (string-match "[0-9]+" string)
  (match-string 0 string)))

(defun kmax-check-mode (mode)
 ""
 (interactive)
 (if (not (derived-mode-p mode))
  (error (concat "error: buffer not in a mode derived from <" (prin1-to-string mode) ">."))))

(defun kmax-check-one-of-modes (modes)
 ""
 (interactive)
 (setq kmax-tmp nil)
 (dolist (mode modes) (if (kmax-try (kmax-mode-is-derived-from mode) nil) (setq kmax-tmp t)))
 kmax-tmp)
 
(defun kmax-mode-is-derived-from (mode)
 ""
 (interactive)
 (equal (derived-mode-p mode) mode))

(defun kmax-check-is-derived-from-one-of-modes (modes)
 ""
 (interactive)
 (kmax-not-yet-implemented))

(defun kmax-get-user ()
 "return the current user"
 (chomp (shell-command-to-string "whoami")))

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))
;; thanks to “Pascal J Bourguignon” and “TheFlyingDutchman 〔zzbba…@aol.com〕”. 2010-09-02

(defun kmax-edit-filename-for-source-of-major-mode (mode)
 (let ((file-name (file-name-sans-extension (symbol-file mode))))
  (if (kmax-file-exists-p (concat file-name ".el"))
   (concat file-name ".el")
   (if (kmax-file-exists-p (concat file-name ".el.gz"))
    (concat file-name ".el.gz")))))

(defun kmax-edit-source-of-current-major-mode ()
 "Edit the emacs source of the current major mode"
 (interactive)
 ;; from http://stackoverflow.com/questions/9559197/edit-current-emacs-major-mode
 (find-library (kmax-edit-filename-for-source-of-major-mode major-mode)))

(defun kmax-load-file (file)
 "Load a file if it exists"
 (if (file-exists-p file)
  (load file)))

(defun kmax-list-buffers-derived-from-mode (mode)
 "List the buffers that are derived from the mode passed as an argument
  mode - 'academician-mode"
 (let ((current-buffer (current-buffer))
       (result (kmax-grep-list (buffer-list)
		(lambda (buffer) 
		 (save-excursion 
		  (set-buffer buffer)
		  ;; (derived-mode-p mode)
		  (string= major-mode mode)
		  )))))
  (set-buffer current-buffer)
  result))

(defun see (data &optional duration)
 ""
 (interactive)
 (message (prin1-to-string data))
 (sit-for (if duration duration 2.0))
 data)

;; (defun seev (symbol &optional duration)
;;  ""
;;  (interactive)
;;  (assert (symbolp symbol))
;;  (message 
;;   (concat 
;;    (prin1-to-string symbol) ": "
;;    (prin1-to-string (eval symbol))
;;    ))
;;  (sit-for (if duration duration 2.0))
;;  (eval symbol))

(let ((dir "/var/lib/myfrdcsa/codebases/internal/kmax/frdcsa/emacs"))
 (if (file-exists-p dir)
  (setq load-path
   (cons dir load-path))))

(defun kmax-top-of-kill-ring ()
 ""
 (substring-no-properties (nth 0 kill-ring)))

(defun kmax-create-buffer-from-string-with-name (string name)
 (if (get-buffer buffer)
  (kill-buffer-ask buffer))
 (let ((buffer (get-buffer-create name)))
  (save-excursion
   (switch-to-buffer buffer)
   (insert string)))
 (get-buffer name))

;; FIXME: change this function to be diffing various parts of the
;; FreeKBS2 stack
(defun diff-region-with-top-of-kill-ring ()
 ""
 (interactive)
 (ediff-buffers
  (kmax-create-buffer-from-string-with-name
   (buffer-substring-no-properties (mark) (point)))
  (kmax-create-buffer-from-string-with-name
   (kmax-top-of-kill-ring))))

(defun kmax-new-shell ()
 ""
 (interactive)
 (if (not (kmax-mode-is-derived-from 'shell-mode))
  (shell))
 (if (> (kmax-count-lines-page) 1)
  (progn
   (rename-uniquely)
   (shell))))

(defun kmax-count-lines-page ()
 "Report number of lines on current page, and how many are before or after point."
 ;; copied and slightly modified from count-lines-page
 (interactive)
 (save-excursion
  (let ((opoint (point)) beg end
	total before after)
   (forward-page)
   (beginning-of-line)
   (or (looking-at page-delimiter)
    (end-of-line))
   (setq end (point))
   (backward-page)
   (setq beg (point))
   (setq total (count-lines beg end)
    before (count-lines beg opoint)
    after (count-lines opoint end))
   total)))

(defun kmax-buffer-visible-p (&optional buffer)
 (let
  ((test-buffer (or buffer (current-buffer))))
  (cond ((eq test-buffer (window-buffer (selected-window)))
	 ;; (message "Visible and focused")
	 t)
   ((get-buffer-window test-buffer)
    ;; (message "Visible and unfocused")
    t)
   (t
    ;; (message "Not visible")
    nil))))

(defun kmax-async-shell-command-new-buffer (command)
 ""
 (let ((tmp async-shell-command-buffer))
  (setq async-shell-command-buffer 'new-buffer)
  (async-shell-command command)
  (setq async-shell-command-buffer tmp)))

;; (defun kmax-buffer-exists-p (&optional search)
;;  "Search all buffers for a given text string"
;;  (interactive)
;;  (let ((search (or search (read-from-minibuffer "Search: ")))
;;        (matching-buffers nil))
;;   (dolist (buffer (buffer-list))
;;    (if (equals buffer search)
;;     (push buffer matching-buffers)))))

(defun kmax-get-buffer-file-name ()
 ""
 (interactive)
 (freekbs2-push-onto-stack buffer-file-name))

(defun kmax-strip-hidden-files (file-list)
 (kmax-grep-list-regexp file-list "^[^\.]"))

(defun kmax-directory-files-no-hidden (directory)
 ""
 (interactive)
 (if (not (file-exists-p directory))
  (error (concat "Directory does not exist: " directory))
  (kmax-strip-hidden-files (directory-files directory))))

(defun kmax-hash-keys (hash)
 ""
 (let ((result-list nil))
  (maphash (lambda (key value) (push key result-list)) hash)
  result-list))
 
(defun kmax-hash-values (hash)
 ""
 (let ((result-list nil))
  (maphash (lambda (key value) (push value result-list)) hash)
  result-list))

(defvar kmax-run-in-shell-autocomplete-commands
 (list
  "boss etags"
  ))

(defun kmax-run-in-shell-autocomplete ()
 ""
 (interactive)
 (run-in-shell
  (completing-read "Shell command to run in buffer: " kmax-run-in-shell-autocomplete-commands)))

(defun kmax-update-frdcsa-repositories ()
 ""
 (interactive)
 (kmax-server-restart)
 (sit-for 0.5)
 (run-in-shell "update-frdcsa-git"))

(defun kmax-process-running (process) ""
 (interactive)
 (not (string= (shell-command-to-string (concat "ps auxwww | grep " process " | grep -v grep | wc -l")) "0\n")))

(defun kmax-lock ()
 ""
 (interactive)
 (shell-command "/var/lib/myfrdcsa/codebases/internal/kmax/scripts/screensaver.sh"))

(defun kmax-lock-old ()
 ""
 (interactive)
 (if (kmax-process-running "xscreensaver")
  (run-in-shell "xscreensaver-command -l &")
  (if (kmax-process-running "gnome-screensaver")
   (run-in-shell "gnome-screensaver-command -l &")
   (run-in-shell "(xscreensaver &) ; sleep 2; xscreensaver-command -l &"))))

(defun kmax-write-string-to-file (string file)
 ""
 (save-excursion
  (let ((buffer-name "*kmax-save-string*"))
   (switch-to-buffer (get-buffer-create buffer-name))
   (insert string)
   (write-file file)
   (kill-buffer (current-buffer)))))
  
(defun kmax-butterfly ()
 ""
 (interactive)
 (kmax-not-yet-implemented))

(defun kmax-condense-whitespace-in-region (arg)
 ""
 (interactive "P")
 (freekbs2-push-region-onto-stack nil)
 (kill-region (point) (mark))
 (insert (freekbs2-condense-whitespace (freekbs2-pop-stack nil))))

(defun kmax-contains-all-terms (string term-list)
 ""
 (setq kmax-contains-all-terms-all-match t)
 (mapcar (lambda (term)
	  (if (not (kmax-string-match-p term string))
	   (setq kmax-contains-all-terms-all-match nil))) term-list)
 kmax-contains-all-terms-all-match)

(defun kmax-mode-match (element my-list)
 ""
 (cl-subsetp (list element) my-list))

(defun kmax-file-contents (filename)
 ""
 (interactive)
 (if (file-exists-p filename)
  (save-excursion
   (find-file-noselect filename)
   (kmax-buffer-contents (find-buffer-visiting filename)))))

(defun kmax-buffer-contents (&optional buffer)
 "FIX ME"
 (interactive)
 (save-excursion
  (if buffer
   (set-buffer buffer))
  (mark-whole-buffer)
  (buffer-substring-no-properties (point) (mark))))

(defun kmax-ask-for-password-and-push-on-kill-ring (&optional system)
 ""
 (interactive)
 (let ((password (password-read
		  (concat "Password"
		   (if (boundp 'system) (concat " for " system) "")
		   "?: "))))
    (cond
     ((not (stringp password))
      nil)
     ((and kill-ring (string= password (current-kill 0 t)))
      (message "Already copied %s" password)
      password)
     (t
      (kill-new password)
      (message "Copied %s" password)
      password))))

(defun kmax-kill-buffer-no-ask (buffer)
 ""
 (save-excursion
  (pop-to-buffer buffer)
  (let ((process (get-buffer-process buffer)))
   (if (non-nil process)
    (set-process-query-on-exit-flag process nil)))
  (kill-this-buffer)))

;; see "/var/lib/myfrdcsa/codebases/internal/kmax/frdcsa/emacs/kmax-command-log-mode/kmax-command-log-mode.el"
(load "/var/lib/myfrdcsa/codebases/internal/kmax/frdcsa/emacs/kmax-command-log-mode/kmax-command-log-mode-autoloads.el")

(defun kmax-start-kmax-command-log-mode ()
 ""
 (kmax-fixme "note that this doesn't properly log functions that are executed in its output buffer")
 (interactive)
 (kmax-command-log-mode)
 (global-kmax-command-log-mode)
 (kmax-clm/open-kmax-command-log-buffer))

(defun kmax-find-file-or-create-including-parent-directories (file)
 ""
 (interactive)
 (let ((directory (eshell/dirname file)))
  (kmax-mkdir-p directory)
  (find-file file)))

(defun kmax-end-of-buffer-p ()
 ""
 (interactive)
 (save-excursion
  (let ((position (point)))
   (end-of-buffer)
   (equal position (point)))))

(defun kmax-directory-p (file)
 (file-directory-p file))

(defun kmax-mkdir-p (directory)
 (interactive)
 (if (not (file-directory-p directory))
  (mkdir directory t)))

(defun kmax-env (varname)
 ""
 (chomp (shell-command-to-string (concat "echo $" varname))))

(defun kmax-fix-local-file (file)
 ;; FIXME: replace this with a more general subsitution command
 ""
 (string-match "^~\\/\\(.+\\)" file)
 (let ((string (match-string 1 file)))
  (if string
   (frdcsa-el-concat-dir (list (kmax-env "HOME") string))
   file)))

(defun kmax-fixme (message &optional signal-not-yet-implemented delay silent)
 ""
 (unless silent (see (concat "FIXME: " message) (or delay 0.2)))
 (if signal-not-yet-implemented (kmax-not-yet-implemented)))

(defun kmax-fixme-silent (message &optional signal-not-yet-implemented delay)
 ""
 (kmax-fixme message signal-not-yet-implemented delay t))

(defun kmax-get-current-directory ()
 (interactive)
 (cond
  ((kmax-mode-is-derived-from 'shell-mode)
   default-directory)
  ((kmax-mode-is-derived-from 'eshell-mode)
   default-directory)
  ((kmax-mode-is-derived-from 'dired-mode)
   (dired-current-directory))
  (t nil)))


(defun kmax-which (command)
 (interactive)
 (car
  (kmax-grep-list
   (mapcar
    (lambda (line)
     (if (and (file-exists-p line) (not (string= line "")))
      line
      nil))
    (split-string
     (shell-command-to-string
      (concat
       "source /var/lib/myfrdcsa/codebases/internal/myfrdcsa/frdcsa.bashrc;  "
       "which " (shell-quote-argument command)))
     "\n"))
   (lambda (line) (non-nil line))))
 ;; (chomp (shell-command-to-string (see (concat "which " (shell-quote-argument command)))))
 )

(defun kmax-clean-emacs-backups (&optional arg)
 (interactive "P")
 (shell-command
  (concat
   (kmax-which "clean-emacs-backups")
   " "
   (if arg "-r " "")
   (kmax-get-current-directory)))
 (if (derived-mode-p 'dired-mode)
  (revert-buffer)))

(defun kmax-get-environment-variable (var)
 ""
 (interactive)
 (chomp (shell-command-to-string (concat "echo $" (shell-quote-argument var)))))

(defun kmax-get-wanted-list ()
 ""
 (interactive)
 (ffap
 (frdcsa-el-concat-dir (list
  (kmax-get-environment-variable "HOME")
  ".myconfig-private/misc/myfrdcsa/misc/wanted.do"))))

(defun kmax-get-all-list ()
 ""
 (interactive)
 (ffap "/game/media/storage-sshfs/all"))

(defun kmax-hostname ()
 ""
 (interactive)
 (chomp (shell-command-to-string "hostname -f")))

(defun kmax-insert-datestamp ()
 ""
 (interactive)
 (insert (kmax-datestamp)))

(defun kmax-insert-timestamp ()
 ""
 (interactive)
 (insert (kmax-timestamp)))

(defun kmax-datestamp ()
 ""
 (interactive)
 (chomp (shell-command-to-string "datestamp")))

(defun kmax-timestamp ()
 ""
 (interactive)
 (chomp (shell-command-to-string "datestamp -t")))

(defun kmax-end-of-buffer-with-newlines (&optional count)
 (interactive)
 (end-of-buffer)
 (delete-blank-lines)
 (dotimes (tmp count) (insert "\n")))

(defun kmax-edit-temp-buffer (&optional buffer-name)
 (interactive)
 (switch-to-buffer
  (generate-new-buffer
   (or buffer-name "*kmax temp buffer*"))))

(defun kmax-edit-temp-file ()
 ""
 (interactive)
 (ffap (make-temp-file "/tmp/kmax-tmp-file-")))

(defmacro kmax-or-equals (var value)
 ""
 (list 'if `(boundp (quote ,var))
  var
  (list 'setq var value)))

;; from http://stackoverflow.com/questions/2640492/emacs-inverse-search

(defun kmax-my-skip-lines-matching-regexp-forward (regexp)
 "Skip lines matching a regexp."
 (interactive "sSkip lines matching regexp: ")
 (beginning-of-line)
 (while (and (not (eobp)) (looking-at regexp))
  (forward-line 1)))

(defun kmax-my-skip-lines-matching-regexp-backward (regexp)
 "Skip lines matching a regexp."
 (interactive "sSkip lines matching regexp: ")
 (beginning-of-line)
 (while (and (not (eobp)) (looking-at regexp))
      (forward-line -2)))

;; (see (macroexpand '(kmax-or-equals kmax-tmp-variable 10)))
;; (makunbound 'kmax-tmp-variable)
;; (setq kmax-tmp-variable 5)
;; (kmax-or-equals kmax-tmp-variable 10)


(defun kmax-buffer-exists-p (buffer-or-buffer-name)
 (and
  (non-nil buffer-or-buffer-name)
  (non-nil (get-buffer buffer-or-buffer-name))))

(defun kmax-rename-window-uniquely-and-start-new-shell ()
 ""
 (interactive)
 (if (kmax-mode-is-derived-from 'shell-mode)
  (progn
   (rename-uniquely)
   (shell))))

(defun kmax-find-name-dired-predicate (dir predicate)
 (let* ((matches nil))
  (mapcar
   (lambda (file) (if (funcall predicate file) (push file matches)))
   (mapcar #'kmax-string-leading-dot-slash
    (split-string (shell-command-to-string
		   (concat
		    "find "
		    (shell-quote-argument dir)
		    " -follow")))))
  matches))

(defun kmax-find-name-dired (dir pattern &optional no-follow)
 (kmax-grep-list-regexp
  (mapcar #'kmax-string-leading-dot-slash
   (split-string (shell-command-to-string
		  (concat
		   "find "
		   (shell-quote-argument dir)
		   (if (not no-follow)" -follow" "") " | grep -iE "
		   (shell-quote-argument pattern))) "\n")) "."))

(defun kmax-string-leading-dot-slash (string)
 (replace-regexp-in-string "^\./" "" string))

(defun kmax-get-unused-key-sequence-completions (key-binding-string)
 (interactive)
 (setq kmax-key-binding-results nil)
 (let* ((key-list (listify-key-sequence key-binding-string))
	(all-key-list (kmax-get-unbound-key-sequences)))
  (if nil
   (progn
    (see key-list)
    (see all-key-list)
    (with-temp-file "/tmp/tmp1"
     (insert (prin1-to-string all-key-list)))))
  (mapcar
   (lambda (list)
    (if (kmax-list-has-initial-segment list key-list)
     (progn
      (let ((seq (kmax-list-everything-after-initial-segment list key-list)))
       (if (non-nil seq)
  	(push seq kmax-key-binding-results))))))
   all-key-list)
  kmax-key-binding-results))

(defvar kmax-key-binding-results nil)

(defun kmax-get-key-binding-at-point ()
 (interactive)
 (read (thing-at-point 'nonwhitespace t)))

(defun kmax-get-unused-key-sequence-completions-for-key-binding-at-point ()
 (interactive)
 (let ((options (sort (kmax-delistify-events-lists (kmax-get-unused-key-sequence-completions (kmax-get-key-binding-at-point))) #'string-lessp)))
  (completing-read "Choose next key: " options nil t)))
	
(defun kmax-list-first-n-elements-of-list (list n)
 (if (<= n (length list))
  (reverse (nthcdr (- (length list) n) (reverse list)))
  nil))

;; test (kmax-list-last-n-elements-of-list (list 1 2 3 4 5 6) 3)

(defun kmax-list-last-n-elements-of-list (list n)
 (reverse (kmax-list-first-n-elements-of-list (reverse list) n)))

(defun kmax-list-has-initial-segment (list candidate-initial-segment)
 (equal
  candidate-initial-segment
  (kmax-list-first-n-elements-of-list list
   (length candidate-initial-segment))))

(defun kmax-list-everything-after-initial-segment (list initial-segment)
 (nthcdr (length initial-segment) list))

(put 'nonwhitespace 'forward-op 'forward-nonwhitespace)
(put 'nonwhitespace 'beginning-op 'beginning-nonwhitespace)
(put 'nonwhitespace 'end-op 'end-nonwhitespace)

(defun forward-nonwhitespace () 
 ""
 (re-search-forward "\\s-")
 (backward-char 1))

(defun beginning-nonwhitespace ()
 ""
 (re-search-backward "\\s-")
 (forward-char 1))

(defun end-nonwhitespace ()
 ""
 (re-search-forward "\\s-")
 (backward-char 1))

(defun kmax-get-unbound-key-sequences ()
 ""
 (interactive)
 (kmax-list-unset-input-events-for-prefix-key)
 (let* ((key-binding-strings (split-string (kmax-buffer-contents "*Unbound Keys*") "\n")))
  (kmax-kill-buffer-no-ask (get-buffer "*Unbound Keys*"))
  (pop key-binding-strings)
  (mapcar (lambda (key-binding-string) (listify-key-sequence (kbd key-binding-string))) key-binding-strings)))

(defun kmax-key-sequence-read-event (ev)
 (interactive (list
	       (let ((inhibit-quit t) quit-flag)
		(read-event "Insert KEY, EVENT, or CODE: "))))
 (setq kmax-results nil)
 (let ((ev2 (and (memq 'down (event-modifiers ev))
	     (read-event)))
       (tr (and (keymapp function-key-map)
	    (lookup-key function-key-map (vector ev)))))
  (when (and (integerp ev)
	 (or (and (<= ?0 ev) (< ev (+ ?0 (min 10 read-quoted-char-radix))))
	  (and (<= ?a (downcase ev))
	   (< (downcase ev) (+ ?a -10 (min 36 read-quoted-char-radix))))))
   (setq unread-command-events (cons ev unread-command-events)
    ev (read-quoted-char (format "Enter code (radix %d)" read-quoted-char-radix))
    tr nil)
   (if (and (integerp ev) (not (characterp ev)))
    (push (list (char-to-string ev)) kmax-results)))  ;; throw invalid char error
  (setq ev (key-description (list ev)))
  (when (arrayp tr)
   (setq tr (key-description (list (aref tr 0))))
   (if (y-or-n-p (format "Key %s is translated to %s -- use %s? " ev tr tr))
    (setq ev tr ev2 nil)))
  (push (list (if (= (char-before) ?\s)  "" " ") ev " ") kmax-results)
  (if ev2
   (push (list (key-description (list ev2)) " ") kmax-results)))
 kmax-results)

(defun kmax-get-value-for (item)
 (nth 1 (car (kmax-key-sequence-read-event item))))

(defun kmax-delistify-events-list (events-list)
 (setq kmax-tmp-1 nil)
 (mapcar
  (lambda (event)
   (push (kmax-get-value-for (list event)) kmax-tmp-1))
  events-list)
 kmax-tmp-1)

(defun kmax-delistify-events-lists (events-lists)
 (setq kmax-tmp-2 nil)
 (mapcar
  (lambda (events-list)
   (push (join " " (kmax-delistify-events-list events-list)) kmax-tmp-2))
  events-lists)
 kmax-tmp-2)

;; (kmax-try 'concat (list "a" "b"))

(defun kmax-try (function args &optional else finally error-msg)
 ""
 (interactive)
 (kmax-fixme-silent "implement else finally etc")
 (condition-case ex
  (progn
   (eval (append (list 'funcall 'function) args))
   )   
  ('error
   (see (or error-msg (concat "Function <" function "> did not work with args <" (join " " args) ">"))))))

(defun kmax-funcall (function args &optional else finally error-msg)
 ""
 ;; e.g. (kmax-funcall 'concat (list "a" "b"))
 (interactive)
 (kmax-fixme-silent "implement else finally etc")
 (condition-case ex
  (progn
   (eval (append (list 'funcall 'function) args))
   )   
  ('error
   (see (or error-msg (concat "Function <" function "> did not work with args <" (join " " args) ">"))))))

(defun kmax-try-sample (function args &optional error-msg)
 ""
 (interactive)
 (condition-case nil
  (let ((function 'concat)
	(args (list "a" "b")))
   (eval (append (list 'funcall 'function) args)))
  (error (or error-msg (concat "Function <" function "> did not work with args <" (join " " args) ">")))))

(defun kmax-insert-kmax-not-yet-implemented ()
 ""
 (interactive)
 (insert "(kmax-not-yet-implemented)")
 (indent-according-to-mode))

(defun kmax-record-bug-with-function-designated-by-keybinding ()
 (interactive)
 (let* ((key-sequence (read-key-sequence "Please enter key sequence for function to record bug for function: "))
	(function (find-function-on-key key-sequence))
	(bug-text (read-from-minibuffer (concat "Please type problem with function: " function))))
  (freekbs2-assert-formula ("fixme" function bug-text) "Org::FRDCSA::BOSS")))

(defun kmax-reset-string-match ()
 ""
 (interactive)
 (string-match "\\(abc\\)" "a")
 (kmax-try
  (match-string 1 "")
  nil))

(defun kmax-x (string times)
 (interactive)
 (setq kmax-x-list nil)
 (dotimes (i times)
  (push string kmax-x-list))
 (let ((result (join "" kmax-x-list)))
  (setq kmax-x-list nil)
  result))

;; (kmax-check-function-all-true-for-list (lambda (x) (> x 1)) (mapcar #'list (list 2 3 4)))
;; (kmax-check-function-all-true-for-list (lambda (x) (> x 1)) (mapcar #'list (list 1 2 3 4)))
(defun kmax-check-function-all-true-for-list (function list)
 (interactive)
 (setq kmax-all-true-result t)
 (mapcar (lambda (items) (if (not (apply function items)) (setq kmax-all-true-result nil))) list)
 kmax-all-true-result)

(defun kmax-search-files (search files &optional buffer-name flags filters)
 ""
 (interactive)
 (let* ((file-containing-files-to-search (make-temp-file "/tmp/kmax-search-files-" nil ".txt"))
	(command
	 (concat
	  "tr '\\n' '\\0' <"
	  file-containing-files-to-search
	  " | LANG=C xargs -r0 grep -iF "
	  flags
	  " "
	  (shell-quote-argument search)
	  " "
	  (or filters "")
	  " 2> /dev/null")))
  (kmax-write-string-to-file (join "\n" files) file-containing-files-to-search)
  (if buffer-name
   (run-in-shell command buffer-name)
   (shell-command-to-string command))))

(defun kmax-search-function-definitions (search)
 (interactive)
 (kmax-not-yet-implemented))

(defun kmax-tidy-function ()
 ""
 (interactive)
 (save-excursion
  (mark-defun)
  (indent-region (point) (mark))
  (forward-sexp)
  (eval-last-sexp nil)
  (save-buffer)))

(defun kmax-remove-carriage-returns-from-string (string)
 (interactive)
 (replace-regexp-in-string "[\n\r]+" " " string))

(defun kmax-get-line ()
 ""
 (interactive)
 (save-excursion
  (move-end-of-line nil)
  (set-mark (point))
  (move-beginning-of-line nil)
  (buffer-substring-no-properties (point) (mark))))

(defun kmax-insert-over-region (start end string)
 (interactive)
 (kill-region start end)
 (insert string))

(defun kmax-is-commented (start end)
 (kmax-not-yet-implemented))

(defun kmax-toggle-comment-region (start end)
 ""
 (interactive)
 (kmax-not-yet-implemented)
 (if (kmax-is-commented start end)
  (uncomment-region start end)
  (comment-region start end)))

(defun kmax-alist-keys (alist)
 (mapcar 'car alist))

(defun kmax-alist-values (alist)
 (mapcar 'cdr alist))

;; (defun kmax-reload-source ()
;;  ""
;;  (interactive)
;;  (let ((buffer (current-buffer))
;;        (buffer-extant (nlu-mf-edit-nlu-manual-formalization-mode-source)))
;;   (kmax-eval-buffer)
;;   (pop-to-buffer buffer)
;;   (nlu-manual-formalization-mode)
;;   (if (not buffer-extant)
;;    (kill-buffer (find-buffer-visiting nlu-mf-mode-source-filename)))))

(defun kmax-grep-list-regexp (list regexp &optional temporary-case-fold-search)
 "accept a list and grep through the list for matches, returning the matching list"
 (let ((outputlist nil)
       (current-case-fold-search case-fold-search))
  (setq case-fold-search temporary-case-fold-search)
  (mapcar (lambda (item) (if (non-nil (string-match regexp item)) (push item outputlist))) list)
  (setq case-fold-search current-case-fold-search)
  outputlist))

(defun kmax-grep-v-list-regexp (list regexp)
 "accept a list and grep through the list for matches, returning the matching list"
 (let ((outputlist nil))
  (mapcar (lambda (item) (if (not (non-nil (string-match regexp item))) (push item outputlist))) list)
  outputlist))

;; (kmax-grep-list (list 'a 'b 'c 'd) (lambda (item) (eq item 'a)))
;; (kmax-grep-list-regexp (list "a" "b" "c") "^a")

(defun kmax-grep-list (list test)
 (let ((outputlist nil))
  (mapcar (lambda (item) (if (funcall test item) (push item outputlist))) list)
  outputlist))

;; (kmax-strip-trailing-forward-slashes "test/")

(defun kmax-strip-trailing-forward-slashes (filename)
 (string-match "^\\(.+?\\)\/*$" filename)
 (match-string 1 filename))

(defun kmax-get-directory-files-match (dir regexp &optional fully-qualified)
 ""
 (interactive)
 (if (file-directory-p dir)
  (let ((files (kmax-grep-list-regexp
		(kmax-directory-files-no-hidden dir)
		regexp)))
   (if fully-qualified
    (mapcar
     (lambda (basename)
      (frdcsa-el-concat-dir (list dir basename)))
     files)
    files))
  nil))

(defun kmax-strip-outer-characters-matching-regexp (string regexp)
 (interactive)
 (replace-regexp-in-string (concat regexp "$") ""
  (replace-regexp-in-string (concat "^" regexp) "" string)))

(defun kmax-get-buffer-file-name-all-modes ()
 ""
 (cond
  ((non-nil buffer-file-name) buffer-file-name)
  ((kmax-mode-is-derived-from 'dired-mode) dired-directory)
  ((kmax-mode-is-derived-from 'shell-mode) (eshell/pwd))
  ((kmax-mode-is-derived-from 'eshell-mode) (eshell/pwd))))

(defun kmax-toggle-trace-function-of-function-at-point ()
 ""
 (interactive)
 (let* ((symbol (symbol-at-point))
	(function (if (functionp symbol) symbol nil)))
  (if symbol
   (if function
    (progn
     (if (trace-is-traced function)
      (untrace-function function)
      (trace-function function))
     (prin1 (trace-is-traced function)))
    (error (concat "symbol is not a function: " symbol)))
   (error "no symbol at point"))))

;; (find-function 'kmax-get-button-at-point-action)

(defun kmax-get-button-at-point-action ()
 (button-get (button-at (point)) 'action))

(defun kmax-function-macro-or-special-form-at-point (&optional function-arg)
 ""
 (interactive)
 (let* ((symbol (if function-arg function-arg (symbol-at-point)))
	(function (if (or (functionp symbol) (macrop symbol) (special-form-p symbol))
		   symbol nil)))
  (if (or function-arg symbol)
   (if function
    (see function 0)
    (error (concat "symbol is not a function: " symbol)))
   (error "no symbol at point"))))

(defun kmax-find-function-or-macro ()
 ""
 (interactive)
 (cond
  ((kmax-mode-is-derived-from 'prolog-mode) (formalog-prolog-find-predicate))
  ((kmax-mode-is-derived-from 'formalog-repl-mode) (formalog-prolog-find-predicate))
  ((kmax-mode-is-derived-from 'emacs-lisp-mode) (kmax-find-function-or-macro-elisp))
  (t (kmax-find-function-or-macro-elisp))))

(defun kmax-find-function-or-macro-elisp (&optional function-arg)
 (interactive)
 (let ((function (or function-arg (kmax-function-macro-or-special-form-at-point))))
  (find-function function)
  (recenter-top-bottom)))
  
(defun kmax-get-function-that-defines-keybinding (&optional key-arg)
 (interactive)
 (let ((function (kmax-function-that-defines-keybinding)))
  (freekbs2-push-onto-stack (prin1-to-string function) nil t)
  (see function)))

(defun kmax-function-that-defines-keybinding (&optional key-arg)
 (let* ((key (or key-arg (read-key-sequence "Describe key (or click or menu item): "))))
  (key-binding key t)))

(defun kmax-find-file-that-defines-keybinding (&optional key-arg)
 (interactive)
 ;; (fixme)
 (kmax-find-function-or-macro (kmax-function-that-defines-keybinding key-arg)))

;; (defun kmax-regexp-for-wn-results (search)
;;  (interactive)
;;  "")

;; (setq kmax-type-predicates (list 'stringp 'macrop 'functionp 'variablep))
;;
;; (defun kmax-duck-type-object (&optional object-arg)
;;  (interactive)
;;  (let ((object
;; 	(read
;; 	 (concat
;; 	  "'"
;; 	  (cond
;; 	   (object-arg object-arg)
;; 	   ((thing-at-point 'symbol) (substring-no-properties (thing-at-point 'symbol)))
;; 	   (t (completing-read "Object to check type of: " (list))))))))
;;   (let ((types nil))
;;    (mapcar (lambda (type)
;; 	    (kmax-funcall type (list "hi"))
;; 	    nil);;)
;;     kmax-type-predicates))))

;; (kmax-what-type-is-this-object ["/var/lib/myfrdcsa/codebases/minor/academician" "academician"])

(kmax-fixme "not yet working from emacs (all-instances #$FRDCSAMinorCodebase #$EverythingPSC)")

(defun kmax-which-existing (command-arg)
 (let ((file-path (kmax-which command-arg)))
  (if file-path
   file-path
   nil)))

(defun kmax-shell-command-p (command-arg)
 (let ((result  (kmax-which-existing command-arg)))
  (if result
   (file-exists-p result)
   nil)))

;; test (kmax-shell-command-p "grep-R-emacs")
;; test (kmax-find-shell-command "grep-R-emacs")

(defun kmax-find-shell-command (&optional command-arg)
 ""
 (interactive)
 (let ((path (kmax-which-existing (or command-arg (thing-at-point 'filename t)))))
  (if path (ffap (see path)))))

(setq kmax-act-on-thing-at-point-mappings
 '(('kmax-shell-command-p . 'ffap)
   ('functionp . 'kmax-find-function-or-macro)
   ('macrop . 'kmax-find-function-or-macro)))

;; (defun kmax-act-on-thing-at-point ()
;;  ""
;;  (let ((thing (thing-at-point 'symbol)))
;;   (mapcar
;;    (lambda (entry)
;;     (if (kmax-funcall (car entry) (list thing))
;;      (eval (cdr entry)))) kmax-act-on-thing-at-point-mappings)))

;; (re-search-forward (kmax-regexp-for-frdcsa-project-names)))

;; write a function that checks if the variable is defined, if its
;; defined, return its result, otehrwise set the value of the function
;; to the next thing and return that

;; (kmax-edit-variable-value 'kmax-project-names-rexexp)

(defun kmax-edit-variable-value (variable)
 ""
 (interactive)
 (kmax-edit-object variable))

(defun kmax-edit-object (variable)
 "edit the stack in the minibuffer"
 (interactive)
 (setq- (eval variable)
  (car
   (read-from-string
    (substring-no-properties
     (read-from-minibuffer
      (concat "Please edit the variable value for " (prin1-to-string variable) ": ")
      (prin1-to-string (eval variable))))))))

;; (kmax-funcall 'setq (list ''kmax-project-names-rexexp nil))

;; (defun kmax-edit-object (object)
;;  "edit the stack in the minibuffer"
;;  (interactive)
;;  (kmax-funcall 'setq
;;   (list (eval object) "a")))



;;    (list (car 
;; 	  (read-from-string
;; 	   (read-from-minibuffer "" (prin1-to-string (eval object)))))))))




(defun kmax-unset-unbind-unmake-delete-remove-variable (variable)
 (makunbound variable))

;; (kmax-unset-unbind-unmake-delete-remove-variable 'kmax-project-names-rexexp)

;; (progn
;;  (setq kmax-project-names-rexexp "a")
;;  (kmax-setq 'kmax-project-names-rexexp 'kmax-get-project-names-regexp)
;;  (kmax-unset-unbind-unmake-delete-remove-variable 'kmax-project-names-rexexp)
;;  (kmax-setq 'kmax-project-names-rexexp 'kmax-get-project-names-regexp))

;; need to make kmax-setq and kmax-funcall into macros to work properly

;; (defun kmax-setq (var value)
;;  ;; (kmax-setq kmax-tmp-1 "b")
;;  (if (boundp var)
;;   (see var)
;;   (see (kmax-funcall 'setq (list var value)))))

;;   (progn
;;    (see "ho" 1)
;;    (see "no" 0.2))
;;   (progn
;;    (see "hi" 1)
;;    (see "no" 0.2))))

;;  (setq var (kmax-funcall var function))))

;; (defun kmax-get-project-names-regexp ()
;;  (concat "\\("
;;   (join "\\|"
;;    ;;(kmax-list-first-n-elements-of-list (mapcar #'regexp-quote
;;    (cmh-act-on-referent
;;     (list 'mt 'ret)
;;     "all-instances"
;;     "#$FRDCSAMinorCodebase"
;;     "#$EverythingPSC"))
;;   ;;  5)
;;   "\\)"))

;; (defvar kmax-project-names-rexexp nil)

;; (defun kmax-search-for-project ()
;;  (interactive)
;;  (re-search-forward (kmax-setq 'kmax-project-names-rexexp 'kmax-get-project-names-regexp)))

;; (defun kmax-get-regexp-for-frdcsa-project-names ()
;;  ""
;;  (kmax-setq kmax-regexp-for-frdcsa-project-names))

;; (defun kmax-regexp-for-matches (matches))

(defun kmax-map-end-of-buffer-and-recenter-top-bottom-over-all-visible-buffers (skip-list)
 ""
 (interactive)
  (walk-windows
   (function
    (lambda (w)
     (setq kmax-tmp nil)
     (mapcar
      (lambda (skip)
       (if (and (buffer-file-name (window-buffer w)) skip)
	(if (string=
	     (file-chase-links (buffer-file-name (window-buffer w)))
	     (file-chase-links skip))
	 (setq kmax-tmp t))))
      skip-list)
     (if (not kmax-tmp)
      (progn
       (pop-to-buffer (window-buffer w))
       (end-of-buffer)
       (kmax-recenter-bottom)))))))

(defun kmax-recenter-top ()
 ""
 (let ((this-scroll-margin
	(min (max 0 scroll-margin)
	 (truncate (/ (window-body-height) 4.0)))))
  (recenter this-scroll-margin)))

(defun kmax-recenter-middle ()
 ""
 (recenter))

(defun kmax-recenter-bottom ()
 ""
 (let ((this-scroll-margin
	(min (max 0 scroll-margin)
	 (truncate (/ (window-body-height) 4.0)))))
  (recenter (- -1 this-scroll-margin))))

(defun kmax-get-key-sequence-description ()
 ""
 (interactive)
 (join " " (reverse (kmax-delistify-events-list (read-key-sequence "Describe key (or click or menu item): ")))))

(defun kmax-insert-key-sequence-description ()
 ""
 (interactive)
 (insert (kmax-get-key-sequence-description)))

(defun kmax-non-directory-file (path)
 (and
  (file-exists-p path)
  (not
   (file-directory-p path))))

;; (kmax-filename-has-extension "temp.subl" "subl")

(defun kmax-filename-has-extension (filename extension)
 ""
 (kmax-string-match-p (concat "." extension "$") filename))

;; (defun kmax-filename-matches-extension-list (filename extension-list)
;;  ""
;;  (mapcar (lambda (extension) (kmax-filename-has-extension filename extension)) extension-list))

(defun kmax-xdg-open (file)
 (interactive)
 ;; in the future check if there is an active graphical emacs window
 ;; with focus and open on that, if a pdf or something like that.
 (browse-url-xdg-open selected-file-full-path))

(defun kmax-prolog-quote (prolog &optional outer-quotation)
 ;; (if (equal outer-quotation "'")
 ;;  (kmax-do-string-replace-regexes prolog '(("'" "\\'")))
 ;;  ;; (kmax-do-string-replace-regexes "he's great" '(("'" "\\'")))
 ;;  ;; (kmax-do-string-replace-regexes (list "he's great") '(("e" "a")))
 ;;  ;; (concat "'" prolog "'"))
 ;;  )
 (concat "'" prolog "'"))

(defun kmax-directory-exists-p (file)
 (interactive)
 (file-directory-p file))

;; (kmax-list-all-absolute-subdirectories-of-directories-no-hidden (list "/home" "/tmp"))

(defun kmax-list-all-absolute-subdirectories-of-directories-no-hidden (directories)
 (interactive)
 (mapcar
  #'kmax-list-all-absolute-subdirectories-of-directory-no-hidden
  directories))

(defun kmax-list-all-absolute-subdirectories-of-directory-no-hidden (directory)
 (interactive)
 (mapcar
  (lambda (subdirectory)
   (frdcsa-el-concat-dir (list directory subdirectory)))
  (kmax-grep-list (kmax-directory-files-no-hidden directory)
  (lambda (file) (kmax-directory-exists-p (frdcsa-el-concat-dir (list directory file)))))))

(defun kmax-get-all-subdirectories-of-directories-in-list (list)
 (interactive)
 (let ((directories nil))
  (mapcar (lambda (x) (setq directories (append directories x)))
   (mapcar (lambda (file) (kmax-find-name-dired-predicate file #'kmax-directory-exists-p))
    list))
  directories))

(defun kmax-open-file-from-directory (dir)
 ""
 (interactive)
 (if (kmax-directory-exists-p dir)
  (ffap (ido-completing-read (kmax-directory-files-no-hidden dir)))))

;; (let ((test "~/to.do"))
;;  (string-match "^\~\/\\(.*\\)$" test)
;;  (see (match-string 1 test)))

(defun seev (debug item &optional delay)
 (if debug
  (see item delay)
  item))

;; (seev t t)
;; (string-match "^\~\/\\(.*\\)$" "/home/andrewdo/.config/frdcsa/todo/latest.do")
;; (kmax-chase "/home/andrewdo/.config/frdcsa/todo/latest.do")

(defun kmax-chase (filename)
 ""
 (interactive)
 (let* ((debug t)
	(delay 0)
	(item (progn
	       (if (string-match "^\~\/\\(.*\\)$" filename)
		(match-string 1 filename))))
	(file (if (not (not item))
	       (frdcsa-el-concat-dir (list (kmax-get-environment-variable "HOME") item))
	       filename)))
  (chomp
   (shell-command-to-string
    (concat "chase "
     (shell-quote-argument file)))
   )))

(defun kmax-chase-seev (filename)
 ""
 (interactive)
 (let* ((debug t)
	(delay 0)
	(item (progn
	       (if (string-match "^\~\/\\(.*\\)$" filename)
		(match-string 1 filename))))
	(file (if (not (not (seev debug item delay)))
	       (frdcsa-el-concat-dir (list (kmax-get-environment-variable "HOME") item))
	       (seev debug filename delay))))
  (seev debug file delay)
  (chomp
   (seev
    debug
    (shell-command-to-string
     (concat "chase "
      (shell-quote-argument file)))
    delay))))

(defun kmax-run-command-in-repl (command)
 ""
 (interactive)
 (end-of-buffer)
 (insert command)
 (comint-send-input))

(defun kmax-edit-list (type list-name &optional file-name)
 ""
 (interactive)
 (if (eq type 'elisp)
  (progn
   (if (non-nil file-name)
    (if (file-exists-p file-name)
     (ffap file-name)
     (error (concat "No such file " file-name))))
   (beginning-of-buffer)
   (re-search-forward (concat "^(setq " list-name))
   (beginning-of-line)
   (forward-sexp)
   (beginning-of-line)
   (open-line 1)
   (indent-for-tab-command)
   (insert "(\"\" . \"\")")
   (beginning-of-line)
   (indent-for-tab-command)
   (forward-char 2))
  )
 (if (eq type 'prolog)
  (progn
   (if (non-nil file-name)
    (if (file-exists-p file-name)
     (ffap file-name)
     (error (concat "No such file " file-name))))
   (beginning-of-buffer)
   (re-search-forward (concat "^(setq " list-name))
   (beginning-of-line)
   (forward-sexp)
   (beginning-of-line)
   (open-line 1)
   (indent-for-tab-command)
   (insert ";; (\"\" . \"\")")
   (beginning-of-line)
   (indent-for-tab-command)
   (forward-char 5))
  )
 )

(defun kmax-decamelcase (string)
 (join " " (mapcar #'capitalize (kmax-decamelcase-into-list string))))

(defun kmax-decamelcase-into-list (string)
 ""
 (interactive)
 (let ((words nil))
  (while (kmax-non-empty-string string)
   (let* ((word (kmax-get-next-word string))
	  (word-length (length word))
	  (string-length (length string)))
    ;; (see word 0.2)
    (unshift word words)
    (setq string (substring string word-length string-length))))
  words))

(defun kmax-get-next-word (string)
 ""
 (interactive)
 (let ((original-value case-fold-search))
  (setq case-fold-search nil)
  (string-match "^\\([A-Za-z][a-z]*\\)" string)
  (let ((result (match-string 1 string)))
   (setq case-fold-search original-value)
   result)))

(defun kmax-file-list-chase-alist (file-list)
 ""
 (interactive)
 (mapcar (lambda (file) (if (stringp file) (cons file (kmax-chase file)))) file-list))

(defun kmax-empty-string (string)
 (not (kmax-non-empty-string string)))

(defun kmax-non-empty-string (string)
 (> (length string) 0))

(defun kmax-sexp-string-at-point ()
 ""
 (interactive)
 (save-excursion
  (set-mark (point))
  (forward-sexp)
  (buffer-substring-no-properties (point) (mark))))

(defun kmax-edit-variable-value ()
 ""
 (interactive))

(defvar kmax-specialized-emacs-session-type-hash (make-hash-table :test 'equal))

(defun kmax-get-index-of-first-item-in-list (item1 list)
 (let ((i 0)
       (pos nil))
  (mapcar
   (lambda (item2)
    (if (not pos)
     (if (equal item1 item2)
      (setq pos i)))
    (cl-incf i)) list)
  pos))

(defun kmax-file-exists-p (file)
 ""
 (interactive)
 (file-exists-p file))

;; (kmax-get-index-of-first-item-in-list "d" (list "b" "c" "a" "d"))

;; (defun kmax-ensure-compatible-specialized-emacs-session-type ()
;;  ""
;;  (interactive)
;;  (let ((type (gethash 'type kmax-bspecialized-emacs-session-types)))
;;   (if derive)))

(defmacro kmax-case-equal (expr &rest clauses)
  "Eval EXPR and choose among clauses on that value.
Each clause looks like (KEYLIST BODY...).  EXPR is evaluated and compared
against each key in each KEYLIST; the corresponding BODY is evaluated.
If no clause succeeds, cl-case returns nil.  A single atom may be used in
place of a KEYLIST of one atom.  A KEYLIST of t or `otherwise' is
allowed only in the final clause, and matches if no other keys match.
Key values are compared by `eql'.
\n(fn EXPR (KEYLIST BODY...)...)"
  (declare (indent 1) (debug (form &rest (sexp body))))
  (let* ((temp (if (cl--simple-expr-p expr 3) expr (make-symbol "--cl-var--")))
	 (head-list nil)
	 (body (cons
		'cond
		(mapcar
		 (function
		  (lambda (c)
		    (cons (cond ((memq (car c) '(t otherwise)) t)
				((eq (car c) 'cl--ecase-error-flag)
				 `(error "cl-ecase failed: %s, %s"
                                         ,temp ',(reverse head-list)))
				((listp (car c))
				 (setq head-list (append (car c) head-list))
				 `(cl-member ,temp ',(car c)))
				(t
				 (if (memq (car c) head-list)
				     (error "Duplicate key in case: %s"
					    (car c)))
				 (push (car c) head-list)
				 `(equal ,temp ',(car c))))
			  (or (cdr c) '(nil)))))
		 clauses))))
    (if (eq temp expr) body
     `(let ((,temp ,expr)) ,body))))

(defun kmax-drop-last-n-chars (string n)
 (interactive)
 (let ((length (length string)))
  (substring string 0 (- length n))))

(defun kmax-strip-filename-extension (filename)
 (progn
  (string-match "^\\(.+?\\)\.\\([^\.]+\\)$" filename)
  (match-string 1 filename)))
  
(defun kmax-swap-filename-extensions (from-ext to-ext files)
 (interactive)
 (let ((length-from-ext (+ (length from-ext) 1)))
  (mapcar (lambda (file) (concat (kmax-drop-last-n-chars file length-from-ext) "." to-ext)) files)))

(defun kmax-load-frdcsa-system ()
 ""
 (let ((frdcsa-system (completing-read "FRDCSA System To Load?: " (list "academician"))))
  (kmax-not-yet-implemented)
  ))

;; (kmax-downcase-first-letter-of-word-and-forward-word "CamelCase")

(defun kmax-downcase-first-letter-of-word (string)
 ""
 (let* ((chars (split-string string "")))
  (pop chars)
  (shift chars)
  (concat (downcase (car chars)) (join "" (cdr chars)))))

(defun char-at-point ()
 ""
 (save-excursion
  (set-mark (point))
  (forward-char)
  (buffer-substring-no-properties (point) (mark))))

(defun kmax-downcase-first-letter-of-word-and-forward-word ()
 ""
 (interactive)
 (kmax-not-yet-implemented)
 (save-excursion
  (set-mark (point))
  (end-of-line)
  (narrow-to-region (point) (mark))
  (beginning-of-line)
  (let ((regex "[a-zA-Z0-9-_]*"))
   (if (not (kmax-string-match-p regex (char-at-point)))
    (re-search-forward regex))
   (setq kmax-insert-result (kmax-downcase-first-letter-of-word (word-at-point)))
   (set-mark (point))
   (forward-char (length result))
   (kill-region (point) (mark))
   (widen)))
 (insert kmax-insert-result))

(defun kmax-ffap-or-dired (file &optional mode)
 (interactive)
 (if (kmax-file-exists-p file)
  (progn
   (ffap file)
   (if mode
    (kmax-funcall mode nil)))
  (if (kmax-directory-exists-p file)
   (dired file))))

(defun kmax-string-match-p (regexp string)
 (string-match-p regexp string))

(defun kmax-test-function ()
 (+ 1 1))

(defun kmax-cycle-next-buffer-with-mode (mode sort-function)
 "Go to the next buffer in the ring of buffers"
 (interactive)
 (let* ((buffer-list
	 (reverse (sort
		   (kmax-list-buffers-derived-from-mode mode)
		   sort-function))))
  (unshift (nth 0 buffer-list) buffer-list)
  ;; (see buffer-list)
  (mapcar
   (lambda (buffer) 
    (if (eq (current-buffer) buffer)
     (setq kmax-cycle-choice kmax-cycle-choice-last))
    (setq kmax-cycle-choice-last buffer))
   buffer-list)
  (switch-to-buffer kmax-cycle-choice)))

(defun kmax-cycle-previous-buffer-with-mode (mode sort-function)
 "Go to the next buffer in the ring of buffers"
 (interactive)
 (let* ((buffer-list
	 (sort
	  (kmax-list-buffers-derived-from-mode mode)
	  sort-function)))
  (unshift (nth 0 buffer-list) buffer-list)
  ;; (see buffer-list)
  (mapcar
   (lambda (buffer) 
    (if (eq (current-buffer) buffer)
     (setq kmax-cycle-choice kmax-cycle-choice-last))
    (setq kmax-cycle-choice-last buffer))
   buffer-list)
  (switch-to-buffer kmax-cycle-choice)))

(defun kmax-sort-buffer-predicate (buffer-a buffer-b)
 "Buffer sorting predicate"
 (string< (buffer-name buffer-a) (buffer-name buffer-b)))


;; FIXME: write a function to present a list of the modes of open
;; files, and when selected choose a random file of that mode, so that
;; it can be cycled through to find the document we're looking for

(defun kmax-cycle-next-current-major-mode ()
 ""
 (interactive)
 (kmax-cycle-next-mode major-mode))

(defun kmax-cycle-previous-current-major-mode ()
 ""
 (interactive)
 (kmax-cycle-previous-mode major-mode))

(defun kmax-cycle-next-mode (mode)
 ""
 (interactive)
 (kmax-cycle-next-buffer-with-mode mode 'kmax-sort-buffer-predicate))

(defun kmax-cycle-previous-mode (mode)
 ""
 (interactive)
 (kmax-cycle-previous-buffer-with-mode mode 'kmax-sort-buffer-predicate))

(defun kmax-open-arbitrarily-large-file (file)
 (let ((large-file-warning-threshold 1000000000))
  (ffap file)))

(defun kmax-find-file (filename)
 ""
 (interactive)
 (if (kmax-non-empty-string filename)
  (if (kmax-file-exists-p filename)
   (ffap filename)
   (if (kmax-file-exists-p (expand-file-name filename))
    (ffap (expand-file-name filename))
    (if (kmax-which-existing filename)
     (ffap (kmax-which-existing filename))
     (ffap))))
  (ffap)))

(defun kmax-ffap ()
 ""
 (interactive)
 (let ((filename (thing-at-point 'filename)))
  (kmax-find-file filename)))

;; (global-set-key "\C-x\C-f" 'ffap)

;; (defun kmax-execute-function-on (text)
;;  (interactive)
;;  (let* ((tokens (split-string text " ")))
;;   (join "" (append (list (kmax-clean-token (downcase (car tokens))))
;; 		 (mapcar #'kmax-clean-token (mapcar #'kmax-to-camelcase (cdr tokens)))))))

;; (defun kmax-execute-function-on-text-in-region (start end)
;;  (interactive "r")
;;  (kmax-execute-function-on (buffer-substring-no-properties start end)))

;; (defun kmax-execute-function-on-text-in-region-and-replace (start end)
;;  (interactive "r")
;;  (let ((prologified-text (kmax-execute-function-on-text-in-region start end)))
;;   (kmax-insert-over-region start end prologified-text)))

(defun kmax-consolidate-list-of-lists-into-single-list (list-of-lists)
 (interactive)
 "similar to append, join, concat, union, etc"
 (apply #'append list-of-lists))

(defun kmax-search-forward-for-any-matching-object-of-type (&optional type-arg)
 (interactive)
 (kmax-search-for-any-matching-object-of-type 'forward type-arg))

(defun kmax-search-backward-for-any-matching-object-of-type (&optional type-arg)
 (interactive)
 (kmax-search-for-any-matching-object-of-type 'backward type-arg))

;; (kmax-search-forward-for-any-matching-object-of-type "planningSoftware")

;; "\\(MADLA\\|CMAP-t\\|CMAP-q\\|MAPR-p\\|PMR\\|MH-FMAP\\|MAPLan/LM-Cut\\|MAPlan/MA-LM-Cut\\|MAPlan/FF\\+DTG\\|PSM-VRD\\|PSM-VR\\|Anytime-LAPKT\\|DFS\\+\\|SIW\\+-then-BFS\\(f\\)\\|ADP\\|ADP-legacy\\|MARC\\|GPPP1\\|GPPP2\\)"

(defun kmax-search-for-any-matching-object-of-type (direction &optional type-arg)
 (interactive)
 (kmax-fixme "Have this function list all types of objects it knows about, when querying which type of object to search")
 (kmax-fixme "Have this function search for all English glosses of all objects")
 (let* ((type (or type-arg (read-from-minibuffer "Type of object for which to search? ")))
	(regex
	 (concat "\\("
	  (join "\\|"
	   (mapcar #'shell-quote-argument
	    (mapcar #'cadr
	     (formalog-query
	      (list 'var-Object)
	      (list "isa" 'var-Object type))))) "\\)")))
  (if (eq direction 'forward)
   (re-search-forward regex)
   (if (eq direction 'backward)
    (re-search-backward regex)))))


;; KMax: Search for first line not containing

(defun kmax-search-forward-for-first-line-not-containing ()
 (interactive)
 (let* ((search (read-from-minibuffer "Not containing: ")))
  (setq kmax-stay-in-while-loop t)
  (while kmax-stay-in-while-loop
   (next-line)
   (let* ((line (kmax-get-line)))
    (if (not (string-match search line))
     (setq kmax-stay-in-while-loop nil))))))

(defun kmax-search-backward-for-first-line-not-containing ()
 (interactive)
 (let* ((search (read-from-minibuffer "Not containing: ")))
  (setq kmax-stay-in-while-loop t)
  (while kmax-stay-in-while-loop
   (previous-line)
   (let* ((line (kmax-get-line)))
    (if (not (string-match search line))
     (setq kmax-stay-in-while-loop nil))))))


;; KMax: Macro

(add-to-list 'kbd-macro-termination-hook 'kmax-macro-end-macro)

(defvar kmax-macro-macro-list nil)
(defvar kmax-macro-recording nil)
(defvar kmax-macro-tmp-hash (make-hash-table :test #'equal))

(defun kmax-macro-get-persistent-macro-names ()
 ""
 (interactive)
 (setq kmax-macro-macro-list nil)
 (maphash (lambda (a b) (push a kmax-macro-macro-list)) kmax-macro-tmp-hash)
 kmax-macro-macro-list)

(defun kmax-macro-start-macro (&optional arg)
 ""
 (interactive "P")
 (setq kmax-macro-recording t)
 (kmacro-start-macro arg))

(defun kmax-macro-end-macro (&optional arg)
 ""
 (interactive "P")
 (kmacro-end-macro nil)
 (setq kmax-macro-recording nil)
 (kmax-macro-persistent-save))

(defun kmax-macro-persistent-save ()
 ""
 (interactive)
 (let* ((tmp-buffer-name "kmax-macro-temp-buffer")
	(macro-name
	 (make-symbol
	  (completing-read
	   "KMax Persistent Macro Name: "
	   (kmax-macro-get-persistent-macro-names))))
	(macro-contents
	 (save-excursion
	  (kmacro-name-last-macro macro-name)
	  (pop-to-buffer
	   (get-buffer-create tmp-buffer-name))
	  (insert-kbd-macro macro-name)
	  (kmax-buffer-contents))))
  (kmax-kill-buffer-no-ask tmp-buffer-name)
  (puthash macro-name macro-contents kmax-macro-tmp-hash)))

;; misc

;; (kmax-find-require 'do-fontify)
;; (kmax-find-require "do-fontify")

(defun kmax-find-require (&optional requirement-arg)
 ""
 (interactive)
 (let ((requirement (or requirement-arg (substring-no-properties (thing-at-point 'symbol)))))
  (ffap (kmax-find-require-filename requirement))))

(defun kmax-find-require-filename (requirement)
 ""
 (interactive)
 (catch 'break (kmax-find-require-filename-helper requirement)))

(defun kmax-find-require-filename-helper (requirement)
 ""
 (dolist (dir load-path)
  (if (kmax-directory-p dir)
   (dolist (file (directory-files dir))
    (let ((filename (frdcsa-el-concat-dir (list dir file))))
     (unless (kmax-directory-p filename)
      (if (kmax-file-contains-provide-p (if (stringp requirement) requirement (prin1-to-string requirement)) filename)
       (throw 'break filename))))))))

(defun kmax-file-contains-provide-p (requirement file)
 ""
 (interactive)
 (if (kmax-file-exists-p file)
  (kmax-grep-q (concat "(provide '" requirement ")") file)))

;; (kmax-file-contains-provide-p 'do-fontify "/var/lib/myfrdcsa/codebases/internal/do/frdcsa/emacs/do-fontify.el")

(defun kmax-grep-q (search file)
 ""
 (interactive)
 (not (string= (chomp (shell-command-to-string (concat "grep -E " (shell-quote-argument search) " " (shell-quote-argument file) " | wc -l"))) "0")))

(defun has-truth-value (item)
 ""
 (interactive)
 (if item
  (message "true")
  (message "false")))

;; (kmax-grep-q "do-fontify" "/var/lib/myfrdcsa/codebases/internal/do/frdcsa/emacs/do-fontify.el")
;; (kmax-grep-q "dodfsd-fontify" "/var/lib/myfrdcsa/codebases/internal/do/frdcsa/emacs/do-fontify.el")

;; (has-truth-value (call-process "exit-0.sh"))
;; (has-truth-value (call-process "exit-1.sh"))

;; Done

(defun kmax-extract-matches (regex string)
 (catch 'done (kmax-extract-matches-helper regex string))
 (let ((string kmax-extract-matches-results))
  (setq kmax-extract-matches-results nil)
  (setq kmax-extract-matches-string nil)
  string))

(defun kmax-extract-matches-helper (regex string)
 ""
 (interactive)
 (setq kmax-extract-matches-results nil)
 (setq kmax-extract-matches-string string)
 (while (length kmax-extract-matches-string)
  (let* ((match (condition-case nil
		 (kmax-extract-match regex kmax-extract-matches-string)
		 (error nil))))
   (if match
    (let* ((new-regex (concat "\\(.*?" (shell-quote-argument match) "\\)"))
	   (strlen (length (kmax-extract-match new-regex kmax-extract-matches-string))))
     (unshift match kmax-extract-matches-results)
     (setq kmax-extract-matches-string (substring kmax-extract-matches-string strlen))
     ;; (see kmax-extract-matches-string 0.1)
     )
    (throw 'done nil)))))

(defun kmax-extract-match (regex string)
 (string-match regex string)
 (match-string 0 string))

;; (see (kmax-extract-matches "\\(a\\)" "abababdfc"))

;; (see (kmax-extract-matches "\\(..\\)" "abababdfc"))

(defun kmax-match-string-file (regex file)
 (let ((contents (kmax-file-contents file)))
  (kmax-extract-matches regex contents)))

;; (kmax-match-string-file "\\(not\\)" "/tmp/5R4dBG16Mw")

;; (kmax-match-string-file "\\(not\\)" "/tmp/5R4dBG16Mw")

(defun kmax-reload-mode (mode)
 ""
 (let ((feature (kmax-get-feature-for-mode mode))
       (filename (kmax-find-require-filename feature)))
  (if (kmax-file-exists-p filename)
   (progn
    (unload-feature feature)
    (load-if-exists filename)))))

;; (see (kmax-list-features-for-mode 'do-todo-list-mode))

(defun kmax-list-features-for-mode (mode)
 (kmax-match-string-file
  "\\(do-todo-list\\)"
  (kmax-edit-filename-for-source-of-major-mode mode)))

(defun kmax-read-file (file)
 (interactive)
 (ffap file)
 (let* ((buffer-name (get-buffer (buffer-name)))
	(contents (kmax-buffer-contents)))
  (kmax-kill-buffer-no-ask buffer-name)
  contents))

(defun kmax-replace-region (replacement-text)
 ""
 (interactive)
 (kill-region (point) (mark))
 (insert replacement-text))

(defun k-assoc (key alist)
 (interactive)
 ""
 (cdr (assoc key alist)))

(defun kmax-make-symbol-quoted (symbol)
 ""
 (read
  (join ""
   (list "'" symbol))))

;; "\\(provide '\\([^)]+\\)\\)"

(require 'unbound)
(require 'kmax-util)
(require 'emacs-colors)
