;;; nema-completion --- Completion
;;; Code:

(use-package company
  :delight
  :hook (after-init . global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-limit 12
        company-idle-delay .2               ; decrease delay before autocompletion popup shows
        company-echo-delay 0                ; remove annoying blinking
        company-minimum-prefix-length 2
        company-require-match nil)
  (defun nema--company-backend-with-yas (backend)
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet)))
  ;; Popup documentation for completion candidates
  (use-package company-quickhelp
    ;; :bind (:map company-active-map
    ;; ("M-h" . company-quickhelp-manual-begin))
    :hook (global-company-mode . company-quickhelp-mode)
    :config (setq company-quickhelp-delay 0.5)))

(when nema-use-lsp
  (use-package lsp-mode
    ;; :delight
    :hook ((ruby-mode
            php-mode
            python-mode
            js-mode typescript-mode js2-mode rjsx-mode
            go-mode
            rust-mode
            c-mode c++-mode objc-mode
            ) . lsp)
    :init
    (setq lsp-inhibit-message t
          lsp-message-project-root-warning t
          lsp-auto-guess-root t
          lsp-response-timeout 20
          lsp-enable-eldoc nil
          lsp-message-project-root-warning t ;; Avoid warning when editing single file
          lsp-clients-php-server-command `("php" ,(expand-file-name "~/.config/composer/vendor/felixfbecker/language-server/bin/php-language-server.php"))
          )
    :config
    (require 'lsp-clients)
    (lsp-clients-register-clangd) ;; Need to call this manually. See lsp-mode/lsp-clients.el
    (defun nema/lsp/restart-server ()
      "Restart LSP server."
      (interactive)
      (lsp-restart-workspace)
      (revert-buffer t t)
      (message "LSP server restarted.")))
  (use-package lsp-ui
    :bind
    (:map lsp-ui-mode-map
          ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
          ([remap xref-find-references] . lsp-ui-peek-find-references)
          ("C-c u" . lsp-ui-imenu))
    :hook (lsp-mode . lsp-ui-mode)
    :config
    (setq scroll-margin 0))
  (use-package company-lsp
    :after company
    :defines company-backends
    :functions company-backend-with-yas
    :init
    (cl-pushnew (nema--company-backend-with-yas 'company-lsp) company-backends)))

(provide 'nema-completion)

;;; nema-completion.el ends here
