
(when (prf/require-plugin 'multi-scratch nil 'no-error)
  (setq multi-scratch-buffer-name "scratch")
  (defalias '_msn 'multi-scratch-new)
  )

(defun prf/thing-at-point (THING)
  "wrapper around thing-at-point to support other types"
  (cond
   ((string= THING 'url)
    (substring  (thing-at-point 'url) 7) )
   (t (thing-at-point THING))
   ) )

(provide 'init-test1)
