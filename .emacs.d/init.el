;;makes it necessary to load emacs
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;automatic theme install for emacs
(unless (package-installed-p 'solarized-theme)
  (package-refresh-contents)
  (package-install 'solarized-theme))
;;automatic install for .emacs macro
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;automatic install and initialization of which key
(use-package which-key
  :ensure t            ;; makes sure package is installed
  :init
  (which-key-mode))

;;alias for yes
(defalias 'yes-or-no-p 'y-or-n-p)

;; shortcut for terminal
(global-set-key (kbd "<s-return>") 'ansi-term)

;;terminal configuration
(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-zsh)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(setq inhibit-startup-message t) ;;disables startup screen
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-gruvbox-dark)))
 '(custom-safe-themes
   (quote
    ("6bf841f77d5eb01455d82ae436e3e25277daaef4ee855a3572589dad1b3ac4b3"  default)))
 '(package-selected-packages (quote (which-key use-package solarized-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
