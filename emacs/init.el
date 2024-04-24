(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode t)

;; Set default font
;;(set-face-attribute 'default nil :family "Liberation Mono" :height 100)
(set-frame-font "Liberation Mono-9.5:antialias=1")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(loveisanillusion\.emacs))
 '(custom-safe-themes
   '("2bd78b9484f58c804bd490edbd268d177e3a36d03a0b6db133f6d3ac1a2282d5" default))
 '(ispell-dictionary nil))


(scroll-bar-mode -1)
(setq-default cursor-type 'bar)
(set-cursor-color "#26d726")
(global-hl-line-mode -1)


(setq window-divider-default-right-width 0) ; Adjust the value as needed
(setq window-divider-default-left-width 0)
(setq window-divider-default-left-width 0)
(setq window-divider-default-bottom-width 0) ; Adjust the value as needed

;; Enable the window divider mode
(window-divider-mode)

;; Set the internal border width (space around text area within the frame)
(setq default-frame-alist '((internal-border-width . 2))) ; Adjust the value as needed

;; Set the external border width (space between frame and window manager's decorations)
(setq default-frame-alist '((left-fringe . 5) (right-fringe . 5))) ; Adjust the value as needed
