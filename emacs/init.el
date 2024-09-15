
;; Basic UI changes
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Cusror Customization
(setq-default cursor-type 'box)
(set-cursor-color "#00ee00")
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)

(global-hl-line-mode 0)
(column-number-mode t)

(setq-default truncate-lines t)

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
(add-to-list 'custom-theme-load-path "C:/Users/SJ Joseph/.dotfiles/emacs/themes/")
(load-theme 'loveisanillusion.emacs t)

;; Startup Screen
(setq inhibit-startup-message t)

;; Messages
(setq inhibit-message nil)

;; Scratch Buffer Message
(setq initial-scratch-message "\
;; SJ Joseph

")

;; Marking
(transient-mark-mode 1)
(setq mark-even-if-inactive nil)

;; Compile
(defun run-build-script ()
  "Run the build.bat"
  (interactive)
  (compile "build.bat"))
(global-set-key (kbd "<f5>") 'run-build-script)

;; Count Words
(global-set-key (kbd "<f6>") 'count-words)

;; Find and Replace
(global-set-key (kbd "<f7>") 'replace-string)

;; Eval Region
(global-set-key (kbd "<f8>") 'eval-region)

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


;; Sound
(set-message-beep 'silent)

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

;; Language Modes
(use-package json-mode
  :ensure t
  :defer t)

(use-package typescript-mode
  :ensure t
  :defer t
  :config
  (setq typescript-indent-level 4))

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

;; LSP
(use-package eglot
  :ensure t
  :hook ((typescript-mode js-mode c++-mode c-mode emacs-lisp-mode) . eglot-ensure))

(add-to-list 'eglot-server-programs
             '((c++-mode c-mode) . ("clangd")))
(add-to-list 'eglot-server-programs
             '((js-mode typescript-mode) . ("typescript-language-server" "--stdio")))


(setq eglot-autoshutdown t)
(setq eglot-extend-to-xref t)

(use-package flymake
  :ensure t
  :hook
  (emacs-lisp-mode . flymake-mode)
  (c++-mode . flymake-mode)
  (c-mode . flymake-mode)
  (emacs-lisp-mode . flymake-mode)
  (js-mode . flymake-mode)
  (typescript-mode . flymake-mode)
  )

;;(add-hook 'typescript-mode-hook 'eglot-ensure)
;;(add-hook 'js-mode-hook 'eglot-ensure)
;;(add-hook 'c++-mode-hook 'eglot-ensure)
;;(add-hook 'c-mode-hook 'eglot-ensure)
;;(add-hook 'emacs-lisp-mode-hook 'eglot-ensure)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c r") 'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c a") 'eglot-code-actions))

(use-package eldoc
  :ensure t
  :hook (emacs-lisp-mode . eldoc-mode))

;; Completion

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-common-or-cycle)
              ("<backtab>" . (lambda ()
                               (interactive)
                               (company-complete-common-or-cycle -1))))
  :config
  (setq company-tooltip-align-annotations t
        company-idle-delay 0.2
        company-minimum-prefix-length 2))



(global-set-key (kbd "<tab>") #'company-indent-or-complete-common)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-/") #'company-complete))

(with-eval-after-load 'company
  (define-key company-active-map
              (kbd "<tab>")
              #'company-complete-common-or-cycle)
  (define-key company-active-map
              (kbd "<backtab>")
              (lambda ()
                (interactive)
                (company-complete-common-or-cycle -1))))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-.") #'company-show-location)
  (define-key company-active-map (kbd "RET") nil))

(global-company-mode)
;; Rainbow Mode
(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-mode))

;; Indent
(setq electric-indent-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(defun indent-whole-buffer ()
  "Indent the entire buffer."
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-<tab>") 'indent-whole-buffer)


;; Case Conversion
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

