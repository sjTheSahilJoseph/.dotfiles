
(deftheme loveisanillusion.emacs "Custom Emacs Theme")

(let ((color_1 "#cec9c9")
      (color_2 "#000000")
      (color_3 "#f39207")
      (color_4 "#21eb10")
      (color_5 "#00acff")
      (color_6 "#540408")
      (color_7 "#f05624")
      (color_8 "#b1b1b1")
      (color_9 "#181717")
      )

(custom-theme-set-faces
 'loveisanillusion.emacs

 ;; Syntax highlighting
 `(default ((t (:foreground ,color_1 :background ,color_2))))
 `(font-lock-comment-face ((t (:foreground ,color_5))))
 `(font-lock-doc-face ((t (:foreground ,color_1))))
 `(font-lock-string-face ((t (:foreground ,color_4))))
 `(font-lock-keyword-face ((t (:foreground ,color_3))))
 `(font-lock-function-name-face ((t (:foreground ,color_1))))
 `(font-lock-variable-name-face ((t (:foreground ,color_1))))
 `(font-lock-builtin-face ((t (:foreground ,color_1))))
 `(font-lock-constant-face ((t (:foreground ,color_1))))
 `(font-lock-type-face ((t (:foreground ,color_3))))
 `(font-lock-preprocessor-face ((t (:foreground ,color_7))))

 ;; Mode-line
 `(mode-line ((t (:foreground ,color_8 :background ,color_9))))
 `(mode-line-inactive ((t (:foreground ,color_8 :background ,color_9))))

 ;; Highlighting current line
 '(hl-line ((t (:background "#222222"))))

 ;; Parenthesis matching
 '(show-paren-match ((t (:background "#444444"))))
 '(show-paren-mismatch ((t (:foreground "#FFFFFF" :background "#FF0000"))))

 ;; Region selection
 `(region ((t (:background "#444444"))))

 ;; Minibuffer prompt
 `(minibuffer-prompt ((t (:foreground ,color_5))))

 ;; Line numbers
 `(line-number ((t (:foreground ,color_3))))
 `(line-number-current-line ((t (:foreground ,color_1))))

 ;; Dired
 `(dired-directory ((t (:foreground ,color_7))))
 `(dired-flagged ((t (:foreground ,color_8))))
 `(dired-header ((t (:foreground ,color_1))))
 `(dired-ignored ((t (:foreground ,color_2))))
 `(dired-marked ((t (:foreground ,color_7))))
 `(dired-perm-write ((t (:foreground ,color_4))))
 `(dired-symlink ((t (:foreground ,color_5))))
 `(dired-warning ((t (:foreground ,color_3))))


 ))

(provide-theme 'loveisanillusion.emacs)
