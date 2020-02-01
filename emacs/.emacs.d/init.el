;;; Packages repo
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;automatic theme install for emacs
(unless (package-installed-p 'gruvbox-theme)
  (package-refresh-contents)
  (package-install 'gruvbox-theme))
;;automatic install for .emacs macro
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(global-hl-line-mode 1)
(load-theme 'gruvbox t)

;;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


;;Loading stuff from org mode file
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))


;;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
    ("8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" default)))
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(helm-autoresize-mode t)
 '(helm-display-source-at-screen-top nil)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(package-selected-packages
   (quote
    (rainbow-identifiers org-bullets slime-company slime company-irony company-c-headers flycheck-clang-analyzer company avy pretty-mode spaceline rainbow-mode rainbow-delimiters magit flycheck evil-org evil which-key all-the-icons-dired all-the-icons-ivy all-the-icons neotree dashboard ivy-hydra ivy-rich counsel hydra general async beacon use-package gruvbox-theme)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "CTDB" :family "Fira Code"))))
 '(hl-line ((t (:inherit nil :background "gray25")))))
