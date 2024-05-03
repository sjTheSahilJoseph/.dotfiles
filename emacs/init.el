;; Default directory
(setq default-directory "C:/Users/sjthe/") 

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
                    :family "Liberation Mono"
                    :height 110
                    :weight 'normal)

;; Theme Stuff
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

