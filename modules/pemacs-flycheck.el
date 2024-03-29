(global-flycheck-mode)

(diminish 'flycheck-mode)

;; Disable checking for Emacs Lisp documentation conventions
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; Use Python 3
(setq-default flycheck-python-pycompile-executable "/usr/bin/python3")


(provide 'pemacs-flycheck)
