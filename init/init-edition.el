
(prf/require-plugin 'prf-smart-edit)

;; ------------------------------------------------------------------------
;; SMART PARENTHESIS

;; - brackets completion
;; http://emacs-fu.blogspot.fr/2010/06/automatic-pairing-of-brackets-and.html
;; - [X] autopair
(when (prf/require-plugin 'autopair nil 'noerror)
  (eval-after-load "autopair"
    '(progn
       (autopair-global-mode 1)
       (if (and (<= emacs-major-version 24)
		(<= emacs-minor-version 3))
	   (progn
	     (setq autopair-autowrap t)
	     (put 'autopair-backspace 'cua-selection 'supersede)
	     )
	 (prf/require-plugin 'wrap-region) ;; replacement for autopair-autowrap
	 )
       ))
  )
;; - [ ] electric-pair
;; http://xahlee.blogspot.fr/2012/06/emacs-24-feature-electric-pair-mode.html


;; ------------------------------------------------------------------------
;; AUTOMATIC HIGHLIGHTING

;; Last paste highlighted
;; - [ ] [[http://www.gnu.org/software/emacs/manual/html_node/emacs/Highlight-Interactively.html]]
;; - [X] volatile-highlights
;; NOTE: disabled as misbehaving randomly
;; (require 'volatile-highlights)
;; (eval-after-load "volatile-highlights"
;; '(volatile-highlights-mode 1))

;; - [ ] http://nschum.de/src/emacs/highlight-symbol/ https://github.com/nschum/highlight-symbol.el
;; -> nice but only for symbols (less nice) -> use it by extending previous comand when nothing selected ?
;; - [ ] [[http://www.emacswiki.org/emacs/MarkerPens]]


;; ------------------------------------------------------------------------
;; MANUAL HIGHLIGHTING
(require 'init-highlighting)


;; ------------------------------------------------------------------------
;; TIMESTAMPS

;; NOTE: all these unused / untested

;; Smart timestamps
(setq
 time-stamp-active t          ; do enable time-stamps
 time-stamp-line-limit 10     ; check first 10 buffer lines for Time-stamp:
 time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format
;; Update them when saving
(add-hook 'write-file-hooks 'time-stamp)

(defvar date-format-compact "%Y%m%d"
  "Format of date to insert with `prf/insert-current-date-compact' func
See help of `format-time-string' for possible replacements")
(defvar datetime-format-compact "%Y%m%d%H%M%S"
  "Format of date to insert with `prf/insert-current-datetime-compact' func
See help of `format-time-string' for possible replacements")
(defun prf/insert-current-date-compact ()
  "insert the current date into the current buffer."
  (interactive)
  (insert (format-time-string date-format-compact (current-time)))
  )
(defun prf/insert-current-datetime-compact ()
  "insert the current date into the current buffer."
  (interactive)
  (insert (format-time-string datetime-format-compact (current-time)))
  )



(provide 'init-edition)
