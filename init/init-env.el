
;; ------------------------------------------------------------------------
;; OS SELECTION

(defun windows-nt-p ()
  (string-equal system-type "windows-nt")
  )
(defun darwin-p ()
  (string-equal system-type "darwin")
  )
(defun gnu/linux-p ()
  (string-equal system-type "gnu/linux")
  )


;; ------------------------------------------------------------------------
;; OS-related customs

(cond
 ((gnu/linux-p)
  (progn
    (setq
     tramp-default-method "ssh"
     )
    (require 'init-linux)
    )
  )
 ((windows-nt-p)
  (progn
    (setq tramp-default-method "pscp")
    ;; tramp-default-method "ssh"
    ;; (if (executable-find "ssh")
    ;; (setq tramp-default-method "scpx")
    ;; (setq tramp-default-method "pscp") )
    (require 'init-w32)
    )
  )
 )


;; ------------------------------------------------------------------------
;; LOCAL SETUP

(setq homedir-truename (directory-file-name (file-truename "~")))

(setq prf/init/host-feature
      (intern
       (concat "init-host-"
	       (if (windows-nt-p) (downcase system-name) system-name))))

(if (featurep prf/init/host-feature)
    (require prf/init/host-feature)
  (setq prf-backup-dir "~/.emacs.d/.saves"
	prf-auto-save-dir "~/.emacs.d/.saves"))


;; ------------------------------------------------------------------------

(provide 'init-env)
