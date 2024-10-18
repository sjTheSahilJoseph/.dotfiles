
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
    (lambda ()
        (setq gc-cons-threshold (* 1024 1024 50))))

(setq read-process-output-max (* 50 1024 1024))

(setq user-full-name "SJ the Sahil Joseph")
(setq user-mail-address "sjthesahiljoseph@gmail.com")

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq use-dialog-box nil)
(setq enable-recursive-minibuffers t)
(setq echo-keystrokes nil)
(setq-default tab-always-indent t)
(setq-default word-wrap t)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(setq sentence-end-double-space nil)
(setq require-final-newline t)
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)
(setq-default scroll-margin 1)
(setq scroll-conservatively 101)
;;(setq scroll-step 5)

(when (bound-and-true-p tooltip-mode)
	(tooltip-mode -1))

(setq-default compilation-always-kill t)
(setq-default compilation-scroll-output t)
(global-set-key (kbd "C-z") nil)

(setq-default cursor-type 'box)
(set-cursor-color "#00ee00")
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)

(global-hl-line-mode 0)
(column-number-mode t)
(global-subword-mode 1)


(setq-default truncate-lines t)

(setq window-divider-default-right-width 0)
(setq window-divider-default-left-width 0)
(setq window-divider-default-bottom-width 0)

(set-frame-font "Liberation Mono 13" nil t)

(add-to-list 'custom-theme-load-path "C:/Users/SJ Joseph/.dotfiles/emacs/themes/")
(load-theme 'loveisanillusion.emacs t)

(setq inhibit-startup-message t)

(setq inhibit-message nil)

(setq initial-scratch-message "\
;; SJ Joseph

")

(defun cursor-color-1 ()
	"Cursor Color 1."
	(interactive)
    (set-cursor-color "#00ee00")
    )

(defun cursor-color-2 ()
	"Cursor Color 2."
	(interactive)
    (set-cursor-color "#00eeff")
    )

(global-set-key (kbd "C-x <f9>") 'cursor-color-1)
(global-set-key (kbd "C-x <f10>") 'cursor-color-2)

(transient-mark-mode 1)
(setq mark-even-if-inactive nil)

(defun run-build-script ()
	"Run the build.bat."
	(interactive)
	(compile "build.bat"))

(global-set-key (kbd "<f5>") 'run-build-script)
(global-set-key (kbd "<f6>") 'count-words)
(global-set-key (kbd "<f7>") 'replace-string)
(global-set-key (kbd "<f8>") 'eval-region)
(global-set-key (kbd "C-x <f5>") 'global-display-line-numbers-mode)
(global-set-key (kbd "C-x <f6>") 'hl-line-mode)

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

(setq auto-save-default nil)
(setq make-backup-files nil)

(global-auto-revert-mode t)

(set-message-beep 'silent)

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
	:defer t
    )

(use-package cc-mode
	:ensure t
	:defer t
	)

(use-package rust-mode
	:ensure t
	:defer t)

(use-package python-mode
	:ensure t
	:defer t
	)

(use-package lua-mode
	:ensure t
	:defer t)

(setq dired-listing-switches "-lah --group-directories-first")

(setq electric-indent-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq lisp-indent-offset 4)
(setq typescript-indent-level 4)

(defun indent-whole-buffer ()
	"Indent the entire buffer."
	(interactive)
	(save-excursion
		(indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-S-<tab>") 'indent-whole-buffer)

(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


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
        (if (and (not test?)                             ;; for check lsp-server-present?
                (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
                lsp-use-plists
                (not (functionp 'json-rpc-connection))  ;; native json-rpc
                (executable-find "emacs-lsp-booster"))
            (progn
                (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
                    (setcar orig-result command-from-exec-path))
                (message "Using emacs-lsp-booster for %s!" orig-result)
                (cons "emacs-lsp-booster" orig-result))
            orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

(setq eldoc-echo-area-use-multiline-p nil)

(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-enable-snippet nil)
(setq lsp-completion-provider :none)

(use-package lsp-mode
    :init
    (setq lsp-keymap-prefix "C-c l")
    :hook (
              (c-mode . lsp)
              (c++-mode . lsp)
              (javascript-mode . lsp)
              (typescript-mode . lsp)
              (python-mode . lsp)
              )
    :commands lsp)

(use-package eldoc-box
    :ensure t
    )

(global-set-key (kbd "<f9>") 'eldoc-box-help-at-point)

(set-face-attribute 'eldoc-box-body nil :font "Liberation Mono-13")

(use-package multiple-cursors
	:defer t
	:ensure t
	)

(global-unset-key (kbd "<down-mouse-3>"))
(global-set-key (kbd "<down-mouse-3>") 'mc/add-cursor-on-click)


(use-package org-bullets
  :ensure t
  :defer t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))



