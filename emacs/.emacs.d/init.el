;;makes it necessary to load emacs
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;automatic theme install for emacs
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))
;;automatic install for .emacs macro
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(global-hl-line-mode 1)

;;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


;;Loading stuff from org mode file
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))


;;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(helm-autoresize-mode t)
 '(helm-display-source-at-screen-top nil)
 '(package-selected-packages
   (quote
    (neotree winum diminish which-key use-package swiper spacemacs-theme spaceline rainbow-mode rainbow-identifiers rainbow-delimiters pretty-mode org-bullets magit helm flycheck-clang-analyzer evil-org evil-collection dashboard company-irony company-c-headers beacon avy all-the-icons)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "CTDB" :family "Fira Code"))))
 '(helm-header ((t (:inherit header-line :weight bold :family "Fira Code"))))
 '(helm-selection ((t (:background "gray25" :distant-foreground "black"))))
 '(helm-source-header ((t (:inherit bold :background "#292b2e" :foreground "#c56ec3" :weight bold :height 1.3 :family "Fira Code"))))
 '(hl-line ((t (:inherit nil :background "gray25")))))
