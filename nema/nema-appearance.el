;;; nema-appearance -- Appearance and UI settings
;;; Commentary:
"Appearance and UI settings 中文测试测试测试"
;;; Code:

;; (use-package hc-zenburn-theme
  ;; :config
  ;; (load-theme 'hc-zenburn t))

;; UI - disable all UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Font
;; ~/.Xresources:
;; Emacs.font: -*-tamzenforpowerline-medium-*-*-*-16-*-*-*-*-*-*-*
(when (display-graphic-p)
  (defvar nema/cjk-font "-gnu-Unifont-Medium-R-Normal-Sans-16-*-*-*-*-*-*"
    "Default CJK font for GUI.")
  ;; (defvar nema/font "Monoid"
  ;;   "Default main font for GUI.")
  ;; (set-fontset-font (frame-parameter nil 'font) nil nema/font)
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
		      (font-spec :name nema/cjk-font))))

;; Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Paren mode

(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(use-package rainbow-delimiters :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; moe-theme
(use-package moe-theme
  :ensure t
  :config
  (setq moe-theme-highlight-buffer-id t)
  (moe-theme-set-color 'yellow)
  (powerline-moe-theme) ;; This must appear AFTER =use-package powerline=
  (moe-dark)
  )

(provide 'nema-appearance)

;;; nema-appearance.el ends here
