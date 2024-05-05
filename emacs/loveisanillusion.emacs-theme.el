
(deftheme loveisanillusion.emacs "Custom Emacs Theme")

;; Defining Colors
(let (
      (color_1 "#c6c6c6")
      (color_2 "#999999")
      (color_3 "#151515")
      (color_4 "#000000")
      (color_5 "#ff9900")
      (color_6 "#26d726")
      (color_7 "#00acff")
      (color_8 "#540408")
      (color_9 "#f05624")
      (color_10 "#0e0e0e")
      (color_11 "#aa0000")
  )

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


(custom-theme-set-faces
 'loveisanillusion.emacs

 ;; Syntax highlighting
 `(default ((t (:foreground ,color_1 :background ,color_4))))
 `(font-lock-comment-face ((t (:foreground ,color_7))))
 `(font-lock-doc-face ((t (:foreground ,color_1))))
 `(font-lock-string-face ((t (:foreground ,color_6))))
 `(font-lock-keyword-face ((t (:foreground ,color_5))))
 `(font-lock-function-name-face ((t (:foreground ,color_1))))
 `(font-lock-variable-name-face ((t (:foreground ,color_1))))
 `(font-lock-builtin-face ((t (:foreground ,color_1))))
 `(font-lock-constant-face ((t (:foreground ,color_1))))
 `(font-lock-type-face ((t (:foreground ,color_5))))
 `(font-lock-preprocessor-face ((t (:foreground ,color_9))))

 ;; Mode-line
 `(mode-line ((t (:foreground ,color_2 :background ,color_10))))
 `(mode-line-inactive ((t (:foreground ,color_2 :background ,color_10))))

 ;; Parenthesis matching
 `(show-paren-match ((t (:background ,color_2))))
 `(show-paren-mismatch ((t (:foreground ,color_1 :background ,color_11))))

 ;; Region selection
 `(region ((t (:background ,color_8))))

 ;; Minibuffer prompt
 `(minibuffer-prompt ((t (:foreground ,color_9))))

 ;; Dired
 `(dired-directory ((t (:foreground ,color_9))))
 `(dired-flagged ((t (:foreground ,color_2))))
 `(dired-header ((t (:foreground ,color_1))))
 `(dired-ignored ((t (:foreground ,color_2))))
 `(dired-marked ((t (:foreground ,color_9))))
 `(dired-perm-write ((t (:foreground ,color_6))))
 `(dired-symlink ((t (:foreground ,color_7))))
 `(dired-warning ((t (:foreground ,color_11))))


 ))

(provide-theme 'loveisanillusion.emacs)
