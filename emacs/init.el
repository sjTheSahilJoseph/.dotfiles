
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

(use-package js
  :ensure nil
  :mode ("\\.js\\'")
  :config
  (setq js-indent-level 4))


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
  :hook (prog-mode . rainbow-mode))

(use-package php-mode
  :ensure t
  :defer t
  )

(use-package rjsx-mode
  :ensure t
  :mode ("\\.jsx\\'" "\\.tsx\\'")
  :config
  (setq js-indent-level 4))

(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function. As an alternative,
  ;; try `cape-dict'.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :custom
  ;; (orderless-style-dispatchers '(orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

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




