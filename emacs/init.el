
;; Startup Screen
(setq inhibit-startup-message t)

;; Messages
(setq inhibit-message nil)

;; Scratch Buffer Message
(setq initial-scratch-message "\
;; SJ Joseph

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
(set-cursor-color "#000000")
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(global-hl-line-mode 0)
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
	:family "Liberation Mono"
	:height 130
    :weight 'regular)

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
(global-set-key (kbd "C-S-P") 'previous-buffer)
(global-set-key (kbd "C-S-N") 'next-buffer)

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

;; Quick Open Files Keymaps
(defun setup-files-keybindings ()
	"Open Files."
	(interactive)
	(defvar my-prefix-map (make-sparse-keymap)
		"My personal prefix keymap.")
	(define-key my-prefix-map (kbd "e") 'open-init-file)
	(define-key my-prefix-map (kbd "t") 'open-theme-file)
	(global-set-key (kbd "C-c m") my-prefix-map))
(setup-files-keybindings)

;; Emacs Config Easy
(defun setup-emacs-config-easy-keybindings ()
	"Emacs Config Easy"
	(interactive)
	(defvar my-prefix-map (make-sparse-keymap)
		"Emacs Config Easy Keymaps.")
	(define-key my-prefix-map (kbd "r") 'eval-region)
	(define-key my-prefix-map (kbd "l") 'global-hl-line-mode)
	(define-key my-prefix-map (kbd "n") 'global-display-line-numbers-mode)
	(global-set-key (kbd "C-c e") my-prefix-map))
(setup-emacs-config-easy-keybindings)

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

(use-package rainbow-mode
	:ensure t
	:hook (prog-mode . rainbow-mode))


;; Indent
(setq electric-indent-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)
(setq-default js-indent-level tab-width)
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

;; Case Conversion
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


