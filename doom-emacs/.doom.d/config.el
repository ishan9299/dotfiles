

;;(org-babel-load-file(expand-file-name "~/.doom.d/config.org"))

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "fira code medium" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-molokai)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Documents/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; keybindings
(define-key evil-normal-state-map (kbd "<f8>") 'neotree-toggle)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-j") #'company-select-next)
  (define-key company-active-map (kbd "C-k") #'company-select-previous)
  (define-key company-active-map (kbd "SPC") #'company-abort))

(define-key evil-normal-state-map(kbd "SPC e r") 'doom/reload)
(defun config-reload()
  (interactive)
  (load-file (find-file "~/.doom.d/config.el")))
(define-key evil-normal-state-map (kbd "SPC e e") 'config-edit)

(defun install-package()
  (interactive)
  (load-file (find-file "~/.doom.d/packages.el")))
(define-key evil-normal-state-map (kbd "SPC e p") 'install-package)

;; Hooks
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(remove-hook 'org-mode-hook 'doom|disable-line-numbers)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; Ivy
(all-the-icons-ivy-setup)
