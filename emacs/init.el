;; Default directory
(setq default-directory "C:/Users/sjthe/") 

;; Theme Stuff
(add-to-list 'custom-theme-load-path "C:/Users/sjthe/.dotfiles/emacs/themes/")
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

;; Indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default sh-basic-offset 4)
(setq-default python-indent-offset 4)
(defun insert-tab-char ()
  "Indent."
  (interactive)
  (insert "    "))
(global-set-key (kbd "TAB") 'insert-tab-char)

;; Open dotfiles
(defun open-dotfiles ()
  "Open /.dotfiles in a new window."
  (interactive)
  (find-file-other-window "c:/users/sjthe/.dotfiles"))

;; Sj's Keymaps
(defun setup-my-keybindings ()
  "Set up personal keybindings."
  (interactive)
  
  (defvar my-prefix-map (make-sparse-keymap)
    "My personal prefix keymap.")
  
  (define-key my-prefix-map (kbd "d") 'open-dotfiles)
  (global-set-key (kbd "C-c m") my-prefix-map)
  )

(setup-my-keybindings)


;; Package Stuff ... coming ...

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

