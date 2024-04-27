;; Startup Screen
(setq inhibit-startup-message t)

;; Basic UI changes
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)
(set-cursor-color "#26d726")
(global-hl-line-mode -1)
(split-window-horizontally)

;; Window UI changes
(setq window-divider-default-right-width 0)
(setq window-divider-default-left-width 0)
(setq window-divider-default-bottom-width 0)

;; Frame UI changes
(setq default-frame-alist
      '((internal-border-width . 2)
        (left-fringe . 5)
        (right-fringe . 5)))

(window-divider-mode)

;; Setting Fonts for Frame
(set-frame-font "Inconsolata Medium-13")

;; Theme Stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(loveisanillusion.emacs))
 '(custom-safe-themes
   '("b88914d156d1c487ef27de29998fd30e43763a39cb67d99b0615f0c90f8feb27" "2bd78b9484f58c804bd490edbd268d177e3a36d03a0b6db133f6d3ac1a2282d5" default))
 '(ispell-dictionary nil))

;; Character Encoding Settings
(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)

;; Autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Tab & Indent
(setq tab-width 4)
(setq-default tab-width 4)
(setq-default indent-line-function 4)
(setq-default indent-tabs-mode t)
(setq-default electric-indent-inhibit t)

;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(defun package--save-selected-packages (&rest opt) nil)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
