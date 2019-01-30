

(when (prf/require-plugin 'prf-md-shiatsu nil 'noerror)

  (defun prf/md-hook/enable-md-shiatsu-minor-mode ()
    (when (string-match-p (regexp-quote "shiatsu") default-directory)
      (prf-md-shiatsu 1)))

  (add-hook 'markdown-mode-hook 'prf/md-hook/enable-md-shiatsu-minor-mode))


(provide 'init-md-org-shiatsu)
