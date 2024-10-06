
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
	:config
	(setq typescript-indent-level 4))

(use-package php-mode
	:ensure t
	:defer t
	)

(use-package cc-mode
	:ensure t
	:defer t
	:config
	(setq c-basic-offset 4)
	)

(use-package csharp-mode
	:ensure t
	:defer t)

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

(use-package rainbow-mode
	:ensure t
	:defer t
	:hook (prog-mode . rainbow-mode))


(setq read-process-output-max (* 10 1024 1024))
(setq gc-cons-threshold 200000000)


(use-package jtsx
    :ensure t
    :mode (("\\.jsx?\\'" . jtsx-jsx-mode)
              ("\\.tsx\\'" . jtsx-tsx-mode)
              ("\\.ts\\'" . jtsx-typescript-mode))
    :commands jtsx-install-treesit-language
    :hook ((jtsx-jsx-mode . hs-minor-mode)
              (jtsx-tsx-mode . hs-minor-mode)
              (jtsx-typescript-mode . hs-minor-mode))
    :custom
    (js-indent-level 4)
    (typescript-ts-mode-indent-offset 4)
    (jtsx-switch-indent-offset 4)
    (jtsx-indent-statement-block-regarding-standalone-parent nil)
    (jtsx-jsx-element-move-allow-step-out t)
    (jtsx-enable-jsx-electric-closing-element t)
    (jtsx-enable-electric-open-newline-between-jsx-element-tags t)
    (jtsx-enable-jsx-element-tags-auto-sync nil)
    (jtsx-enable-all-syntax-highlighting-features t)
    :config
    (defun jtsx-bind-keys-to-mode-map (mode-map)
        "Bind keys to MODE-MAP."
        (define-key mode-map (kbd "C-c C-j") 'jtsx-jump-jsx-element-tag-dwim)
        (define-key mode-map (kbd "C-c j o") 'jtsx-jump-jsx-opening-tag)
        (define-key mode-map (kbd "C-c j c") 'jtsx-jump-jsx-closing-tag)
        (define-key mode-map (kbd "C-c j r") 'jtsx-rename-jsx-element)
        (define-key mode-map (kbd "C-c <down>") 'jtsx-move-jsx-element-tag-forward)
        (define-key mode-map (kbd "C-c <up>") 'jtsx-move-jsx-element-tag-backward)
        (define-key mode-map (kbd "C-c C-<down>") 'jtsx-move-jsx-element-forward)
        (define-key mode-map (kbd "C-c C-<up>") 'jtsx-move-jsx-element-backward)
        (define-key mode-map (kbd "C-c C-S-<down>") 'jtsx-move-jsx-element-step-in-forward)
        (define-key mode-map (kbd "C-c C-S-<up>") 'jtsx-move-jsx-element-step-in-backward)
        (define-key mode-map (kbd "C-c j w") 'jtsx-wrap-in-jsx-element)
        (define-key mode-map (kbd "C-c j u") 'jtsx-unwrap-jsx)
        (define-key mode-map (kbd "C-c j d") 'jtsx-delete-jsx-node)
        (define-key mode-map (kbd "C-c j t") 'jtsx-toggle-jsx-attributes-orientation)
        (define-key mode-map (kbd "C-c j h") 'jtsx-rearrange-jsx-attributes-horizontally)
        (define-key mode-map (kbd "C-c j v") 'jtsx-rearrange-jsx-attributes-vertically))
    
    (defun jtsx-bind-keys-to-jtsx-jsx-mode-map ()
        (jtsx-bind-keys-to-mode-map jtsx-jsx-mode-map))

    (defun jtsx-bind-keys-to-jtsx-tsx-mode-map ()
        (jtsx-bind-keys-to-mode-map jtsx-tsx-mode-map))

    (add-hook 'jtsx-jsx-mode-hook 'jtsx-bind-keys-to-jtsx-jsx-mode-map)
    (add-hook 'jtsx-tsx-mode-hook 'jtsx-bind-keys-to-jtsx-tsx-mode-map))


(setq electric-indent-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq lisp-indent-offset 4)

(defun indent-whole-buffer ()
	"Indent the entire buffer."
	(interactive)
	(save-excursion
		(indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-S-<tab>") 'indent-whole-buffer)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)












