(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode t)

;; Set default font
(set-face-attribute 'default nil
                    :family "Monaspace Neon"
                    :height 100
                    :weight 'normal
                    :width 'normal)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(manoj-dark))
 '(ispell-dictionary nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
