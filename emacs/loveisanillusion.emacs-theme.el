
(deftheme loveisanillusion.emacs
  "Created 2024-04-02.")
(custom-theme-set-faces
 'loveisanillusion.emacs
 ;; Default text color
 '(default ((t (:foreground "#b1b1b1" :background "#000000"))))
 ;; Diff faces
 '(diff-changed ((t (:foreground "#cec9c9"))))
 '(diff-added ((t (:foreground "#f39207"))))
 '(diff-removed ((t (:foreground "#cec9c9"))))
 ;; Error and warning messages
 '(error ((t (:foreground "#cec9c9"))))
 '(warning ((t (:foreground "#cec9c9"))))
 ;; Preprocessor directives
 '(font-lock-preprocessor-face ((t (:foreground "#cec9c9"))))
 ;; Constants and literals
 '(font-lock-constant-face ((t (:foreground "#f39207"))))
 ;; Keywords
 '(font-lock-keyword-face ((t (:foreground "#f39207"))))
 ;; Strings
 '(font-lock-string-face ((t (:foreground "#21eb10"))))
 ;; Functions
 '(font-lock-function-name-face ((t (:foreground "#f6f7f8"))))
 ;; Line numbers
 '(line-number ((t (:foreground "#4b4b4b" :background "#000000"))))
 ;; Comments
 '(font-lock-comment-face ((t (:foreground "#096dc1" :slant italic))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#096dc1" :slant italic))))
 ;; Mode line
 '(mode-line ((t (:bold t :foreground "#b1b1b1" :background "#181717"))))
 '(mode-line-inactive ((t (:foreground "#b1b1b1" :background "#000000"))))
 ;; Search highlight
 '(isearch ((t (:background "#6a6a6d" :foreground "#b1b1b1"))))
 ;; Vertical split
 '(vertical-border ((t (:foreground "#181717"))))
 ;; Search match
 '(match ((t (:background "#540408"))))
 ;; Selection
 (set-face-attribute 'region nil :background "#540408")
 )

(provide-theme 'loveisanillusion.emacs)

