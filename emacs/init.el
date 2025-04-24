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

(setq-default cursor-type 'box)
(set-cursor-color "#40ff40")
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(setq highlight-nonselected-windows nil)
(setq-default cursor-in-non-selected-windows nil)

(setq-default word-wrap t)
(setq-default truncate-lines t)

(setq-default truncate-lines t)
(setq enable-recursive-minibuffers nil)
(setq truncate-partial-width-windows nil)
(setq sentence-end-double-space nil)
(setq require-final-newline t)

(setq-default scroll-margin 1)
(setq scroll-conservatively 101)

(setq window-divider-default-right-width 0)
(setq window-divider-default-left-width 0)
(setq window-divider-default-bottom-width 0)

(set-frame-font "Liberation Mono 12" nil t)

(add-to-list 'custom-theme-load-path "C:/Users/sjthe/projects/loveisanillusion.emacs")
(load-theme 'loveisanillusion.emacs t)

(setq inhibit-startup-message t)
(setq inhibit-message nil)
(setq initial-scratch-message "\
;; SJ the Sahil Joseph

")

(transient-mark-mode 1)
(setq mark-even-if-inactive nil)

(setq-default compilation-always-kill t)
(setq-default compilation-scroll-output t)

(defun run-build-script ()
	"Run the build.bat."
	(interactive)
	(compile "build.bat"))

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

(use-package cc-mode
	:ensure t
	:defer t
	)

(use-package csharp-mode
	:ensure t
	:defer t
	)

(use-package typescript-mode
	:ensure t
	:defer t
    )

(use-package json-mode
	:ensure t
	:defer t)

(use-package python-mode
	:ensure t
	:defer t
	)

(use-package php-mode
	:ensure t
	:defer t
	)

(use-package web-mode
    :ensure t
    :mode
    (("\\.jsx\\'" . web-mode)
        ("\\.tsx\\'" . web-mode))
    )

(defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-enable-auto-pairing nil)
    (setq web-mode-enable-auto-closing nil)
    (setq web-mode-enable-auto-indentation nil)
    (setq web-mode-enable-auto-opening nil)
    (setq web-mode-enable-auto-quoting  nil)
    )


(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq create-lockfiles nil)

(setq eldoc-echo-area-use-multiline-p nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq electric-indent-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-always-indent t)
(setq c-basic-offset 4)
(setq lisp-indent-offset 4)
(setq-default js-indent-level 4)
(setq-default typescript-indent-level 4)
(setq c-default-style "linux")
(setq-default c-indent-level 4)

(defun insert-4-spaces ()
    (interactive)
    (insert "    "))
(global-set-key (kbd "TAB") 'insert-4-spaces)

(global-set-key (kbd "C-<tab>") 'indent-region)

(setq dired-listing-switches "-lah --group-directories-first")
(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

(global-set-key (kbd "<f1>") 'next-error)
(global-set-key (kbd "<f2>") 'previous-error)
(global-set-key (kbd "<f3>") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "<f4>") 'kmacro-end-and-call-macro)
(global-set-key (kbd "<f5>") 'run-build-script)
(global-set-key (kbd "<f6>") 'hl-line-mode)
(global-set-key (kbd "<f7>") 'query-replace)
(global-set-key (kbd "<f8>") 'eval-region)
;;(global-set-key (kbd "<f9>") ')
;;(global-set-key (kbd "<f10>") ')
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
;;(global-set-key (kbd "<f12>") ')

(global-set-key (kbd "C-z") nil)


(put 'dired-find-alternate-file 'disabled nil)
