
(use-package shell
  :ensure nil
  :demand
  :after comint

  :config

  (when (>= emacs-major-version 25)
    (add-to-list 'display-buffer-alist '("*shell*" display-buffer-same-window))))


(use-package shx
  :hook (shell-mode . shx-mode)
  :after shell

  :config

  (defun prf/shx-insert-plot (filename plot-command line-style)
    "Prepare a plot of the data in FILENAME.
Use a gnuplot specific PLOT-COMMAND (for example 'plot') and
LINE-STYLE (for example 'w lp'); insert the plot in the buffer."
    (let* ((img-name (make-temp-file "tmp" nil ".png"))
           (status (call-process
                    shx-path-to-gnuplot nil t nil "-e"
                    (concat
                     "set term png transparent truecolor;"
                     "set border lw 3 lc rgb \""
                     (color-lighten-name (face-attribute 'default :foreground) 5)
                     "\"; set out \"" img-name "\";"
                     ;; PATCHED HERE
                     plot-command " " (shell-quote-argument filename) " "
                     line-style))))
      (when (zerop status) (shx-insert-image img-name))))
  (defalias 'shx-insert-plot #'prf/shx-insert-plot))


(use-package readline-complete
  :ensure nil
  :demand
  :after (auto-complete company)
  :config

  (add-hook 'shell-mode-hook (lambda () (message "JB: %s" explicit-shell-file-name)))

  (cond
   ((member prf/fav-completion-at-point '(ac auto-complete))
    (add-to-list 'ac-modes 'shell-mode)
    (add-hook 'shell-mode-hook
              (lambda ()
                (when (string= explicit-shell-file-name "/bin/bash")
                  ;; TODO: support other bash paths
                  (ac-rlc-setup-sources)))))
   ((eq prf/fav-completion-at-point 'company)
    (push 'company-readline company-backends)
    (add-hook 'rlc-no-readline-hook (lambda () (company-mode -1))))))




(provide 'init-shell)
