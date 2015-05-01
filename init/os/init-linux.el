
;; Fix copy/paste
;; NB: might not be necessary if using autocutsel
(setq
 x-select-enable-clipboard t
 interprogram-paste-function 'x-cut-buffer-or-selection-value
 save-interprogram-paste-before-kill t
 )


;; NOTE: does not work for some WM (e.g. xmonad)
;; BUG: tries to execute it on remote srv if tramp cnnx
(when (executable-find "wmctrl")
  (defun prf/toggle-fullscreen-wmctrl ()
    "toggle full-screen mode"
    (interactive)
    (progn
      (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen")
      ))
  (global-set-key (kbd "<f11>")  'prf/toggle-fullscreen-wmctrl)
  )


;; ------------------------------------------------------------------------
;; FONT

(setq
 prf/font "-unknown-Droid Sans Mono-normal-normal-normal-*-10-*-*-*-m-0-iso10646-1"
 prf/font-height 90
 )


;; ------------------------------------------------------------------------

(provide 'init-linux)
