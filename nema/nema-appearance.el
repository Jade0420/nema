;;; nema-appearance -- Appearance and UI settings
;;; Commentary:
"Appearance and UI settings"
;;; Code:

;; Hide welcome buffer
(setq inhibit-startup-screen t)

;; Powerline
;; (use-package powerline)

;; Nyan mode
;; (use-package nyan-mode
;;   :config
;;   (setq nyan-animate-nyancat t
;; 	nyan-bar-length 35
;; 	nyan-wavy-trail nil
;; 	nyan-minimum-window-width 100)
;;   (nyan-mode))

;; Paren mode
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-character ?\|
        highlight-indent-guides-responsive 'top))

(use-package hc-zenburn-theme
  :config
  (load-theme 'hc-zenburn t))

;; moe-theme
;; (use-package moe-theme
;;   :config
;;   (setq moe-theme-highlight-buffer-id t)
;;   (moe-theme-set-color 'cyan)
;;   ;; (powerline-moe-theme) ;; This must appear AFTER =use-package powerline=
;;   (moe-dark))

;; (use-package doom-themes
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled)
;;   (load-theme 'doom-peacock t)
;;   (doom-themes-visual-bell-config)
;;   (doom-themes-neotree-config)
;;   (doom-themes-org-config))

;; (use-package darkokai-theme
;;   :config
;;   (setq darkokai-mode-line-padding 1
;;         darkokai-use-variable-pitch nil)
;;   (load-theme 'darkokai t))

;; (use-package zenburn-theme
;;   :config
;;   (load-theme 'zenburn t))

(pcase nema-mode-line
  ('smart-mode-line
   (use-package smart-mode-line
     :config
     (setq sml/no-confirm-load-theme t
           sml/theme 'respectful)
     (sml/setup)))
  ('doom-modeline
   (use-package doom-modeline
     :hook (after-init . doom-modeline-init)
     :config
     (use-package all-the-icons
       ;; Remember to run
       ;; (all-the-icons-install-fonts)
       ;; after requiring this package
       ))))

(provide 'nema-appearance)

;;; nema-appearance.el ends here
