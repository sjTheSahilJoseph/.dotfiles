
;; Basic User Interface and Experience Customization
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(setq echo-keystrokes nil)
(global-hl-line-mode 0)
(column-number-mode t)
(global-subword-mode 1)
(when (bound-and-true-p tooltip-mode)
  (tooltip-mode -1))

;; Cursor
(setq-default cursor-type 'box)
(set-cursor-color "#00ee00")
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(setq highlight-nonselected-windows nil)
(setq-default cursor-in-non-selected-windows nil)

;; Horizontal Line
(setq-default word-wrap t)
(setq-default truncate-lines t)

;; Text Editing Basic Experience
(setq-default truncate-lines t)
(setq enable-recursive-minibuffers nil)
(setq truncate-partial-width-windows nil)
(setq sentence-end-double-space nil)
(setq require-final-newline t)

;; Scroll in Emacs
(setq-default scroll-margin 1)
(setq scroll-conservatively 101)

;; Window
(setq window-divider-default-right-width 0)
(setq window-divider-default-left-width 0)
(setq window-divider-default-bottom-width 0)

;; Font
(set-frame-font "Liberation Mono 12" nil t)

;; Theme
(add-to-list 'custom-theme-load-path "C:/Users/SJ Joseph/.dotfiles/emacs/themes/")
(load-theme 'loveisanillusion.emacs t)

;; Toggle Theme
(defun toggle-themes-sj ()
    "Toggle themes SJ."
    (interactive)
    (if (member 'loveisanillusion.emacs custom-enabled-themes)
        (progn
            (disable-theme 'loveisanillusion.emacs)
            (load-theme 'loveisanillusion.emacs.light t)
            (set-cursor-color "#000000"))
        (progn
            (disable-theme 'loveisanillusion.emacs.light)
            (load-theme 'loveisanillusion.emacs t))
        (set-cursor-color "#00ee00"))
    )

;; Startup
(setq inhibit-startup-message t)
(setq inhibit-message nil)
(setq initial-scratch-message "\
;; SJ Joseph

")

;; Mark
(transient-mark-mode 1)
(setq mark-even-if-inactive nil)

;; Compilation
(setq-default compilation-always-kill t)
(setq-default compilation-scroll-output t)

;; Run Build.bat file
(defun run-build-script ()
	"Run the build.bat."
	(interactive)
	(compile "build.bat"))

;; Text System
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

;; Backup and Autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Auto Revert
(global-auto-revert-mode t)

;; Don't make noise
(set-message-beep 'silent)

;; Package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(setq url-queue-timeout 30)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(eval-and-compile
	(setq use-package-always-ensure t
        use-package-expand-minimally t
        warning-minimum-level :error))

;; C/C++ Mode
(use-package cc-mode
	:ensure t
	:defer t
	)

;; C# Mode
(use-package csharp-mode
    :ensure t
    :defer t
    )

;; Rust Mode
(use-package rust-mode
	:ensure t
	:defer t)

;; TypeScript Mode
(use-package typescript-mode
	:ensure t
	:defer t
    )

;; Json Mode
(use-package json-mode
	:ensure t
	:defer t)

;; Python Mode
(use-package python-mode
	:ensure t
	:defer t
	)

;; Lua Mode
(use-package lua-mode
	:ensure t
	:defer t)

;; Rainbow Mode
(use-package rainbow-mode
	:ensure t
	:defer t
    :hook (prog-mode . (lambda ()
                           (rainbow-mode))
              )
    )

;; Enable Meta-C/L/U
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Don't use multiline in echo area for eldoc
(setq eldoc-echo-area-use-multiline-p nil)

;; Indent
(setq electric-indent-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-always-indent t)

;; Indent Region
(global-set-key (kbd "C-<tab>") 'indent-region)


;; LSP
(use-package lsp-mode
    :init
    (setq lsp-keymap-prefix "C-c l")
    :hook (
              (c-mode . lsp)
              (c++-mode . lsp)
              (rust-mode . lsp)
              (csharp-mode . lsp)
              (javascript-mode . lsp)
              (js-mode . lsp)
              (typescript-mode . lsp)
              (python-mode . (lambda ()
                                 (setq lsp-disabled-clients '(mypy-ls pylsp))
                                 (require 'lsp-pyright)
                                 (lsp)))
              )
    :commands lsp)

;; After loading LSP Mode, execute
(with-eval-after-load 'lsp-mode
    (setq lsp-enable-on-type-formatting nil)
    (setq lsp-enable-indentation nil)
    (setq lsp-headerline-breadcrumb-enable nil)
    (setq lsp-modeline-code-actions-enable nil)
    (setq lsp-enable-snippet nil)
    (setq lsp-completion-provider :none)
    (setq lsp-hover nil)
    (setq lsp-ui-doc-enable nil)
    (setq lsp-lens-enable nil)
    (setq lsp-enable-symbol-highlighting nil)
    )


(defun lsp-booster--advice-json-parse (old-fn &rest args)
    "Try to parse bytecode instead of json."
    (or
        (when (equal (following-char) ?#)
            (let ((bytecode (read (current-buffer))))
                (when (byte-code-function-p bytecode)
                    (funcall bytecode))))
        (apply old-fn args)))
(advice-add (if (progn (require 'json)
                    (fboundp 'json-parse-buffer))
                'json-parse-buffer
                'json-read)
    :around
    #'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
    "Prepend emacs-lsp-booster command to lsp CMD."
    (let ((orig-result (funcall old-fn cmd test?)))
        (if (and (not test?)
                (not (file-remote-p default-directory))
                lsp-use-plists
                (not (functionp 'json-rpc-connection))
                (executable-find "emacs-lsp-booster"))
            (progn
                (when-let ((command-from-exec-path (executable-find (car orig-result))))
                    (setcar orig-result command-from-exec-path))
                (message "Using emacs-lsp-booster for %s!" orig-result)
                (cons "emacs-lsp-booster" orig-result))
            orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

(use-package lsp-pyright
    :ensure t
    :after lsp-mode
    :hook (python-mode . (lambda ()
                             (require 'lsp-pyright)
                             (lsp))
              )
    )

;; Dired
(setq dired-listing-switches "-lah --group-directories-first")
(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

;; Org Mode
(use-package org
  :ensure t
  :defer t
  )
(setq org-log-done 'time)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-hide-emphasis-markers t)


;; Keymaps
;;(global-set-key (kbd "<f1>") ')
;;(global-set-key (kbd "<f2>") ')
(global-set-key (kbd "<f3>") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "<f4>") 'kmacro-end-and-call-macro)
(global-set-key (kbd "<f5>") 'run-build-script)
(global-set-key (kbd "<f6>") 'hl-line-mode)
(global-set-key (kbd "<f7>") 'query-replace)
(global-set-key (kbd "<f8>") 'eval-region)
;;(global-set-key (kbd "<f9>") ')
(global-set-key (kbd "<f10>") 'toggle-themes-sj)
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
;;(global-set-key (kbd "<f12>") ')

(global-set-key (kbd "C-z") nil)




