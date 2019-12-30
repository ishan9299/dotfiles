;;makes it necessary to load emacs
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;automatic theme install for emacs
(unless (package-installed-p 'darkokai-theme)
  (package-refresh-contents)
  (package-install 'darkokai-theme))
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
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(helm-autoresize-mode t)
 '(helm-display-source-at-screen-top nil)
 '(package-selected-packages
   (quote
    (cl-lib jedi-core swiper jedi rainbow-identifiers yasnippet-snippets which-key use-package spaceline slime-company rainbow-mode rainbow-delimiters pretty-mode pfuture org-bullets neotree magit hydra ht helm flycheck-clang-analyzer f evil dashboard darkokai-theme company-jedi company-irony company-c-headers beacon all-the-icons ace-window)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 104 :width normal :foundry "ADBO" :family "Fira Code"))))
 '(helm-header ((t (:inherit header-line :weight bold :family "Fira Code"))))
 '(helm-selection ((t (:background "DarkGoldenrod4" :distant-foreground "black"))))
 '(helm-source-header ((t (:background "gray13" :foreground "white" :weight bold :height 1.3 :family "Fira Code"))))
 '(hl-line ((t (:inherit highlight :background "DarkGoldenrod4")))))
