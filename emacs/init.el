
;; Startup Screen
(setq inhibit-startup-message t)

;; Stop Messages
(setq inhibit-message t)

;; Scratch Buffer Message
(setq initial-scratch-message "\
;; SJ Emacs

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
(setq-default cursor-type 'box)
(set-cursor-color "#ff0000")
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(global-hl-line-mode 0)
(split-window-horizontally)
(column-number-mode t)
(setq-default truncate-lines t)



;; Find and Replace
(global-set-key (kbd "<f7>") 'replace-string)

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
    :family "Consolas"
    :height 130
    :weight 'regular)

;; Default directory
(setq default-directory "D:/") 

;; Theme
(add-to-list 'custom-theme-load-path "C:/Users/sjthesahiljoseph/.dotfiles/emacs/themes/")
(load-theme 'loveisanillusion.emacs t)

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

;; Auto load changed file
(global-auto-revert-mode t)

;; Compile
(defun run-build-script ()
	"Run the build.bat"
	(interactive)
	(compile "build.bat"))
(global-set-key (kbd "<f5>") 'run-build-script)

;; Sound
(set-message-beep 'silent)

;; Buffer Navigation
(global-set-key (kbd "<left>") 'previous-buffer)
(global-set-key (kbd "<right>") 'next-buffer)

;; Open dotfiles
(defun open-dotfiles ()
	"Open /.dotfiles."
	(interactive)
	(find-file-other-window "c:/users/sjthesahiljoseph/.dotfiles"))

;; Open Projects
(defun open-projects ()
	"Open /Projects."
	(interactive)
	(find-file-other-window "D:/"))

;; Open Init file
(defun open-init-file ()
	"Open init file."
	(interactive)
	(find-file-other-window "c:/users/sjthesahiljoseph/.dotfiles/emacs/init.el"))

;; Open Theme File
(defun open-theme-file ()
	"Open theme file."
	(interactive)
	(find-file-other-window "C:/Users/sjthesahiljoseph/.dotfiles/emacs/themes/loveisanillusion.emacs-theme.el"))

;; Open Temporary Directory
(defun open-temporary-directory ()
	"Open Temporary Directory."
	(interactive)
	(find-file-other-window "D:/temporary"))

;; Quick Open Directories Keymaps
(defun setup-directories-keybindings ()
	"Open Directories."
	(interactive)
	(defvar my-prefix-map (make-sparse-keymap)
		"My personal prefix keymap.")
	(define-key my-prefix-map (kbd "d") 'open-dotfiles)
	(define-key my-prefix-map (kbd "e") 'open-init-file)
	(define-key my-prefix-map (kbd "p") 'open-projects)
	(define-key my-prefix-map (kbd "m") 'open-temporary-directory)
	(define-key my-prefix-map (kbd "t") 'open-theme-file)
	(global-set-key (kbd "C-c m") my-prefix-map))
(setup-directories-keybindings)

;; Package Setup
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(eval-and-compile
	(setq use-package-always-ensure t
        use-package-expand-minimally t
        warning-minimum-level :error))




(use-package json-mode
	:ensure t
	:defer t)

(use-package typescript-mode
	:ensure t
	:defer t)

(use-package cc-mode
	:ensure t
	:defer t)

(use-package python-mode
	:ensure t
	:defer t)

(use-package csharp-mode
	:ensure t
	:defer t
	:mode "\\.cs\\'")

(use-package php-mode
	:ensure t
	:defer t)

(use-package emmet-mode
	:ensure t
	:config
	(setq emmet-move-cursor-between-quotes t)
	
	:bind (:map emmet-mode
			  ("C-j" . emmet-expand-line))
	:defer t)

(use-package eglot
	:ensure t
	:hook ((python-mode . eglot-ensure)
			  (c-mode . eglot-ensure)
			  (c++-mode . eglot-ensure)
			  (csharp-mode . eglot-ensure))
	:config
	(add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio")))
	(add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd")))
	(add-to-list 'eglot-server-programs '(csharp-mode . ("omnisharp")))
	:bind (:map eglot-mode-map
              ("C-c r" . eglot-rename)))
(setq eglot-stay-out-of '(flymake))


(use-package yasnippet
	:config
	(setq yas-snippet-dirs '("C:/Users/sjthesahiljoseph/.dotfiles/emacs/snippets"))
	(yas-reload-all)
	(yas-global-mode 1)
	(add-hook 'python-mode-hook #'yas-minor-mode))

;; Indent
(setq electric-indent-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)
(setq-default js-indent-level tab-width)
(setq-default php-indent-level tab-width)
(setq-default python-indent-offset tab-width)
(setq lisp-indent-offset tab-width)
(setq lisp-body-indent tab-width)

(defun indent-whole-buffer ()
	"Indent the entire buffer."
	(interactive)
	(save-excursion
		(indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-<tab>") 'indent-whole-buffer)

;; Marking
(transient-mark-mode 1)
(setq mark-even-if-inactive nil)


;; Expanding and Completion
;; m-/ -> dabrev complete
;; c-m=/ -> dabrev expand

;; Transpose Lines
(defun my-transpose-line-up ()
	"Transpose the current line with the line above."
	(interactive)
	(transpose-lines 1)
	(forward-line -2))

(defun my-transpose-line-down ()
	"Transpose the current line with the line below."
	(interactive)
	(forward-line 1)
	(transpose-lines 1)
	(forward-line -1))

(global-set-key (kbd "M-<up>") 'my-transpose-line-up)
(global-set-key (kbd "M-<down>") 'my-transpose-line-down)



;; ORG MODE
(require 'org)
(setq org-log-done 'time)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-hide-emphasis-markers nil)
(add-hook 'org-mode-hook 'visual-line-mode)
(setq org-hide-leading-stars nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;; Header
(defun insert-custom-header ()
	"Insert a custom header at the top of the file."
	(interactive)
	(let ((header (concat
					  "/*\n"
					  "============================================================================\n"
					  "============================================================================\n"
					  "\tFile Name: \n"
					  "\tCreated at - (Date & Time): " (format-time-string "%d-%m-%Y %H:%M") "\n"
					  "\tPurpose of this file: \n"
					  "\tAuthor | Writer: SJ the Sahil Joseph\n"
					  "============================================================================\n"
					  "============================================================================\n"
					  "*/\n\n")))
		(goto-char (point-min))
		(insert header)))

(global-set-key (kbd "C-c h") 'insert-custom-header)





















(custom-set-variables
	;; custom-set-variables was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
	'(package-selected-packages '(yasnippet typescript-mode python-mode json-mode)))
(custom-set-faces
	;; custom-set-faces was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
	)
