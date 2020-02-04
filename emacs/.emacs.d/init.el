;;; Packages repo
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

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
 '(custom-enabled-themes (quote (doom-gruvbox)))
 '(custom-safe-themes
   (quote
    ("845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" default)))
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (doom-themes which-key use-package spaceline slime-company rainbow-mode rainbow-identifiers rainbow-delimiters pretty-mode org-bullets neotree magit ivy-rich ivy-hydra general flycheck-clang-analyzer evil-org doom-modeline dashboard counsel company-irony company-c-headers beacon avy all-the-icons-ivy all-the-icons-dired)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight normal :height 128 :width normal)))))
