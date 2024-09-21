

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
  "Run the build.bat."
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

(use-package emmet-mode
  :ensure t
  )

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'html-mode-hook  'emmet-mode)
(add-hook 'rjsx-mode-hook  'emmet-mode)
(add-hook 'js-mode-hook  'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 4)))
(add-to-list 'emmet-jsx-major-modes 'jsx-mode)
(add-to-list 'emmet-jsx-major-modes 'rjsx-mode)
(add-to-list 'emmet-jsx-major-modes 'js-jsx-mode)
(add-to-list 'emmet-jsx-major-modes 'js2-jsx-mode)
(add-to-list 'emmet-jsx-major-modes 'js-mode)



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

;; LSP
(use-package eglot
  :ensure t
  :hook ((typescript-mode . eglot-ensure)
         (js-mode . eglot-ensure)
         (tsx-mode . eglot-ensure)
         (js-jsx-mode . eglot-ensure)
         (web-mode . eglot-ensure)
		 (c++-mode . eglot-ensure)
		 (c-mode . eglot-ensure)
		 (emacs-lisp-mode-mode . eglot-ensure)
         (php-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))

  )



(setq eglot-autoshutdown t)
(setq eglot-extend-to-xref t)


(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match nil)
  (corfu-preview-current t)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  (corfu-scroll-margin 0)

  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (setq corfu-popupinfo-delay 0.5)
  (setq corfu-min-width 50)
  (setq corfu-max-width 50)
  (setq corfu-count 20)

  )


(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'default)
  (kind-icon-use-icons nil)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))


(use-package cape
  :ensure t
  :config
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster))


(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package dabbrev
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(setq global-corfu-minibuffer
      (lambda ()
        (not (or (bound-and-true-p mct--active)
                 (bound-and-true-p vertico--input)
                 (eq (current-local-map) read-passwd-map)))))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (setq flycheck-indication-mode nil)

  :config
  (setq flycheck-mode-line
        '(:eval
          (pcase flycheck-last-status-change
            (`finished (if flycheck-current-errors
                           (let ((count (let-alist (flycheck-count-errors flycheck-current-errors)
                                          (+ (or .error 0) (or .warning 0) (or .info 0)))))
                             (format " Flycheck: %s issue(s)" count))
                         " Flycheck: No issues"))
            (`running     " Flycheck: Running...")
            (`no-checker  " Flycheck: No checker")
            (`not-checked " Flycheck: Not checked")
            (`errored     " Flycheck: Error")
            (`interrupted " Flycheck: Interrupted")
            (`suspicious  " Flycheck: Suspicious"))))

  
  :bind (:map flycheck-mode-map
              ("M-n" . flycheck-next-error)
              ("M-p" . flycheck-previous-error)))


(use-package flycheck-popup-tip
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-popup-tip-mode))


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



