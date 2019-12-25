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
 '(package-selected-packages
   (quote
    (all-the-icons org-bullets slime-company slime company-jedi company-irony company-c-headers flycheck-clang-analyzer company avy pretty-mode spaceline rainbow-mode rainbow-delimiters magit yasnippet-snippets yasnippet flycheck evil which-key dashboard helm async beacon use-package darkokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1d2021" :foreground "#d5c4a1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "CTDB" :family "Fira Code Medium "))))
 '(cursor ((t (:background "white smoke"))))
 '(hl-line ((t (:inherit highlight :background "dark slate gray")))))
