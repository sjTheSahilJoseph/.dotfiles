
(setq user-full-name "SJ the Sahil Joseph")
(setq user-mail-address "sjthesahiljoseph@gmail.com")

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq echo-keystrokes 0.1)
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

;; Auto load changed file
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
  :defer t)

(use-package csharp-mode
  :ensure t
  :defer t)

(use-package rust-mode
  :ensure t
  :defer t)

(use-package python-mode
  :ensure t
  :defer t)

(use-package lua-mode
  :ensure t
  :defer t)

(use-package rainbow-mode
  :ensure t
  :defer t
  :hook (prog-mode . rainbow-mode))


(use-package company
  :ensure t
  :config (global-company-mode t))
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)

(setq gc-cons-threshold 300000000)
(setq read-process-output-max (* 3072 3072))

(use-package lsp-mode
  :ensure t
  :hook (
		 (typescript-mode . lsp-deferred)
		 (cc-mode . lsp-deferred)
		 (c-mode . lsp-deferred)
		 (c++-mode . lsp-deferred)
		 (rust-mode . lsp-deferred)
		 (javascript-mode . lsp-deferred)
		 (csharp-mode . lsp-deferred)
		 (lua-mode . lsp-deferred)
		 (python-mode . lsp-deferred)
		 (php-mode . lsp-deferred)
		 )
  :commands lsp-deferred)

(setq lsp-log-io nil)

(setq lsp-keymap-prefix "C-c l")

(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-sideline-update-mode 'line)
(setq lsp-ui-sideline-delay '0.5)

(setq lsp-diagnostics-provider :flymake)

(setq lsp-headerline-breadcrumb-enable nil)

(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-doc-side 'right)
(setq lsp-ui-doc-delay '0.5)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-show-with-mouse t)

(global-set-key (kbd "C-.") #'lsp-ui-peek-find-definitions)

(setq lsp-idle-delay 0.500)

(with-eval-after-load 'lsp-mode
  (setq lsp-modeline-diagnostics-scope :workspace))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp))))

(setq electric-indent-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(defun indent-whole-buffer ()
  "Indent the entire buffer."
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-S-<tab>") 'indent-whole-buffer)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


