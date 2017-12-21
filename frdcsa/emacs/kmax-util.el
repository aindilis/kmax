(require 'shell)
(require 'term)

(defun term-switch-to-shell-mode (&optional desired-mode)
 (interactive)
 (if (or
      (equal major-mode 'term-mode)
      (equal desired-mode 'shell-mode))
  (progn
   (shell-mode)
   (set-process-filter  (get-buffer-process (current-buffer)) 'comint-output-filter )
   (local-set-key (kbd "C-j") 'term-switch-to-shell-mode)
   (compilation-shell-minor-mode 1)
   (comint-send-input)
   )
  (progn
   (compilation-shell-minor-mode -1)
   (font-lock-mode -1)
   (set-process-filter  (get-buffer-process (current-buffer)) 'term-emulate-terminal)
   (term-mode)
   (term-char-mode)
   (term-send-raw-string (kbd "C-l"))
   )))

(define-key term-raw-map (kbd "C-j") 'term-switch-to-shell-mode)

(provide 'kmax-util)
