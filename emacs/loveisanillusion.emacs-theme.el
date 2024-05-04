
(deftheme loveisanillusion.emacs "Custom Emacs Theme")


;; Startup Screen
(setq inhibit-startup-message t)

;; Scratch Buffer Message
(setq initial-scratch-message "\
;; SJ's Emacs

")

;; Start in maximized mode
(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)

;; Basic UI changes
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)
(set-cursor-color "#26d726")
(blink-cursor-mode 0)
(global-hl-line-mode 0)
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

;; Setting Fonts
(set-face-attribute 'default nil
                    :family "Cousine"
                    :height 110
                    :weight 'regular)




(let ((normal_text_color "#cec9c9")
      (black_color "#000000")
      (brown_yellow_color "#f39207")
      (light_green_color "#21eb10")
      (blue_color "#00acff")
      (maroon_color "#540408")
      (dark_orange_color "#f05624")
      (little_dark_normal_text_color "#b1b1b1")
      (dark_gray_color "#181717")
      )

(custom-theme-set-faces
 'loveisanillusion.emacs

 ;; Syntax highlighting
 `(default ((t (:foreground ,normal_text_color :background ,black_color))))
 `(font-lock-comment-face ((t (:foreground ,blue_color))))
 `(font-lock-doc-face ((t (:foreground ,normal_text_color))))
 `(font-lock-string-face ((t (:foreground ,light_green_color))))
 `(font-lock-keyword-face ((t (:foreground ,brown_yellow_color))))
 `(font-lock-function-name-face ((t (:foreground ,normal_text_color))))
 `(font-lock-variable-name-face ((t (:foreground ,normal_text_color))))
 `(font-lock-builtin-face ((t (:foreground ,normal_text_color))))
 `(font-lock-constant-face ((t (:foreground ,normal_text_color))))
 `(font-lock-type-face ((t (:foreground ,brown_yellow_color))))
 `(font-lock-preprocessor-face ((t (:foreground ,dark_orange_color))))

 ;; Mode-line
 `(mode-line ((t (:foreground ,little_dark_normal_text_color :background ,dark_gray_color))))
 `(mode-line-inactive ((t (:foreground ,little_dark_normal_text_color :background ,dark_gray_color))))

 ;; Parenthesis matching
 '(show-paren-match ((t (:background "#444444"))))
 '(show-paren-mismatch ((t (:foreground "#FFFFFF" :background "#FF0000"))))

 ;; Region selection
 `(region ((t (:background ,maroon_color))))

 ;; Minibuffer prompt
 `(minibuffer-prompt ((t (:foreground ,blue_color))))

 ;; Line numbers
 `(line-number ((t (:foreground ,brown_yellow_color))))
 `(line-number-current-line ((t (:foreground ,normal_text_color))))

 ;; Dired
 `(dired-directory ((t (:foreground ,dark_orange_color))))
 `(dired-flagged ((t (:foreground ,little_dark_normal_text_color))))
 `(dired-header ((t (:foreground ,normal_text_color))))
 `(dired-ignored ((t (:foreground ,black_color))))
 `(dired-marked ((t (:foreground ,dark_orange_color))))
 `(dired-perm-write ((t (:foreground ,light_green_color))))
 `(dired-symlink ((t (:foreground ,blue_color))))
 `(dired-warning ((t (:foreground ,brown_yellow_color))))


 ))

(provide-theme 'loveisanillusion.emacs)
