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

