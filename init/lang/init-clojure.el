
(use-package clojure-mode)

(use-package cider
  :demand
  :after (clojure-mode)
  :bind (:map cider-mode-map
	      ("C-h f" . cider-doc)
	      ("C-h F" . cider-clojuredocs-web)
	      ("C-h C-f" . cider-find-var)
	      :map cider-repl-mode-map
	      ("C-h f" . cider-doc)
	      ("C-h F" . cider-clojuredocs-web)
	      ("C-h C-f" . cider-find-var)
	      ("C-c E" . cider-repl-clear-buffer)
	      ("C-x k" . cider-quit)
	      ("C-x C-k" . cider-quit))
  :init
  (setq org-babel-clojure-backend 'cider)
  :config
  (require 'ob-clojure)

  ;; stolen from https://github.com/codahale/emacs.d/blob/master/init.el
  (defun prf/cider-repl-reset ()
    (interactive)
    (save-some-buffers)
    (cider-interactive-eval
     (concat "((or (resolve 'user/reset)"
             "     (resolve 'clojure.tools.namespace.repl/refresh)))")))
  (define-key cider-mode-map (kbd "C-c C-x") 'prf/cider-repl-reset)
  (define-key clojure-mode-map (kbd "C-c C-x") 'prf/cider-repl-reset))

(use-package cider-eval-sexp-fu
  :after cider)



;; REFACTORING

;; NB: will be merged into CIDER in the future
(use-package clj-refactor
  :after clojure-mode
  :hook
  ((clojure-mode . clj-refactor-mode)
   (clj-refactor-mode . (lambda () (cljr-add-keybindings-with-prefix "C-c C-m")))))




(provide 'init-clojure)
