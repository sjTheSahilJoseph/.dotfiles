
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


(use-package corfu
    :ensure t
    :custom
    (corfu-cycle t)
    (corfu-auto t)
    (corfu-auto-prefix 1)
    (corfu-auto-delay 0)
    (corfu-popupinfo-delay '(0.5 . 0.2))
    (corfu-preview-current 'insert)
    (corfu-preselect 'prompt)
    (corfu-on-exact-match nil)
    :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ([tab]        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ([backtab]    . corfu-previous)
              ("S-<return>" . corfu-insert)
              ("RET"        . corfu-insert)))

(global-corfu-mode)
(corfu-history-mode)
(corfu-popupinfo-mode)

(use-package flycheck
    :ensure t
    :init (global-flycheck-mode)
    :bind (:map flycheck-mode-map
              ("M-n" . flycheck-next-error)
              ("M-p" . flycheck-previous-error)))


(use-package lsp-mode
    :ensure t
    :hook ((lsp-mode . lsp-diagnostics-mode)
              (lsp-mode . lsp-enable-which-key-integration)
              ((tsx-ts-mode
                   typescript-ts-mode
                   js-ts-mode) . lsp-deferred))
    :custom
    (lsp-keymap-prefix "C-c l")
    (lsp-completion-provider :none)
    (lsp-diagnostics-provider :flycheck)
    (lsp-session-file (locate-user-emacs-file ".lsp-session"))
    (lsp-log-io nil)
    (lsp-keep-workspace-alive nil)
    (lsp-idle-delay 0.5)
    (lsp-enable-xref t)
    (lsp-auto-configure t)
    (lsp-eldoc-enable-hover t)
    (lsp-enable-file-watchers nil)
    (lsp-enable-folding nil)
    (lsp-enable-imenu t)
    (lsp-enable-indentation t)
    (lsp-enable-links nil)
    (lsp-enable-on-type-formatting t)
    (lsp-enable-suggest-server-download t)
    (lsp-enable-symbol-highlighting t)
    (lsp-enable-text-document-color t)

    (lsp-ui-sideline-show-hover nil)
    (lsp-ui-sideline-diagnostic-max-lines 20)
    (lsp-completion-enable t)
    (lsp-completion-enable-additional-text-edit t)
    (lsp-enable-snippet t)
    (lsp-completion-show-kind t)
    
    (lsp-headerline-breadcrumb-enable nil)
    (lsp-headerline-breadcrumb-enable-diagnostics nil)
    (lsp-headerline-breadcrumb-enable-symbol-numbers nil)
    (lsp-headerline-breadcrumb-icons-enable nil)

    (lsp-modeline-code-actions-enable nil)
    (lsp-modeline-diagnostics-enable nil)
    (lsp-modeline-workspace-status-enable nil)
    (lsp-signature-doc-lines 1)
    (lsp-ui-doc-use-childframe t)
    (lsp-eldoc-render-all nil)
    
    (lsp-lens-enable nil)

    (lsp-semantic-tokens-enable nil)

    :preface
    (defun lsp-booster--advice-json-parse (old-fn &rest args)
        "Try to parse bytecode instead of json."
        (or
            (when (equal (following-char) ?#)
                (let ((bytecode (read (current-buffer))))
                    (when (byte-code-function-p bytecode)
                        (funcall bytecode))))
            (apply old-fn args)))
    (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
        "Prepend emacs-lsp-booster command to lsp CMD."
        (let ((orig-result (funcall old-fn cmd test?)))
            (if (and (not test?)
                    (not (file-remote-p default-directory))
                    lsp-use-plists
                    (not (functionp 'json-rpc-connection))
                    (executable-find "emacs-lsp-booster"))
                (progn
                    (message "Using emacs-lsp-booster for %s!" orig-result)
                    (cons "emacs-lsp-booster" orig-result))
                orig-result)))

    :init
    (setq lsp-use-plists t)
    (advice-add (if (progn (require 'json)
                        (fboundp 'json-parse-buffer))
                    'json-parse-buffer
                    'json-read)
        :around
        #'lsp-booster--advice-json-parse)
    (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command))


(use-package lsp-ui
    :ensure t
    :commands
    (lsp-ui-doc-show
        lsp-ui-doc-glance)
    :bind (:map lsp-mode-map
              ("C-c C-d" . 'lsp-ui-doc-glance))
    :config (setq lsp-ui-doc-enable t
                lsp-ui-doc-show-with-cursor t
                lsp-ui-doc-include-signature t
                lsp-ui-doc-position 'at-point))

(setenv "LSP_USE_PLISTS" "true") ;; in early-init.el

(setq read-process-output-max (* 10 1024 1024)) ;; 10mb
(setq gc-cons-threshold 200000000)


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



