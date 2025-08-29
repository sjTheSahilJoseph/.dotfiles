
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(setq echo-keystrokes nil)
(global-hl-line-mode 0)
(column-number-mode t)
(when (bound-and-true-p tooltip-mode)
    (tooltip-mode -1))

(global-subword-mode t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;;(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(split-window-horizontally)

(setq-default cursor-type 'box)

(set-cursor-color "#40ff40")
;;(set-cursor-color "#ff4040")

(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(setq highlight-nonselected-windows nil)
(setq-default cursor-in-non-selected-windows t)

(setq-default word-wrap t)
(setq-default truncate-lines t)

(setq enable-recursive-minibuffers nil)
(setq truncate-partial-width-windows nil)
(setq sentence-end-double-space nil)
(setq require-final-newline nil)

(setq-default scroll-margin 1)
(setq scroll-conservatively 101)

(setq window-divider-default-right-width 0)
(setq window-divider-default-left-width 0)
(setq window-divider-default-bottom-width 0)

(set-frame-font "Liberation Mono 12" nil t)

(setq frame-title-format '("SJ the Sahil Joseph's Writing System"))

(add-to-list 'custom-theme-load-path "C:/Users/sjthe/projects/loveisanillusion.emacs")
(load-theme 'loveisanillusion.emacs t)

(setq inhibit-startup-message t)
(setq inhibit-message t)
(set-message-beep 'silent)
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
(prefer-coding-system 'utf-8)

(setq-default buffer-file-coding-system 'utf-8-unix)

(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

(setq auto-save-default nil)
(setq make-backup-files nil)

(global-auto-revert-mode t)

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

;;(use-package java-mode
;;	)

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
    :defer t
    )

(use-package php-mode
    :ensure t
    :defer t
    )

(use-package web-mode
    :ensure t
    :defer t
    :mode
    (
        ("\\.jsx\\'" . web-mode)
        ("\\.tsx\\'" . web-mode)
        ("\\.html\\'" . web-mode)
        )
    )

(use-package emmet-mode
    :ensure t
    :defer t
    )

(add-hook 'web-mode-hook 'emmet-mode)

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

(use-package vertico
    :ensure t
    :defer t
    :init
    (vertico-mode)
    :config
    (setq vertico-count 30)
    :custom
    (vertico-cycle t))

(use-package vertico-posframe
    :after vertico
    :ensure t
    :custom
    (vertico-posframe-width 100)
    (vertico-posframe-height 30)
    (vertico-posframe-parameters '((left-fringe . 8) (right-fringe . 8)))
    :config
    (vertico-posframe-mode 1))

(use-package orderless
    :ensure t
    :defer t
    :init
    (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))


(setq consult-find-command
    "fd --type f --hidden --color=never --exclude .git --exclude node_modules
 --exclude vendor --exclude dist --exclude build \"%s\"")


(setq consult-preview-key 'any)

(use-package consult
    :ensure t
    :defer t
    :bind (("C-c C-f" . consult-fd)
              ("C-c C-g" . consult-ripgrep)))

(use-package marginalia
    :ensure t
    :defer t
    :init
    (marginalia-mode))

(defun my/project-find-file ()
    "Find file in current project using consult-find + fd."
    (interactive)
    (consult-find (project-root (project-current t))))

(use-package project
    :ensure t
    :defer t
    :config
    (setq project-switch-commands
        '((my/project-find-file "Find file (fd)")
             (consult-ripgrep "Search project (rg)")
             (consult-fd "Search project (fd)")
             (project-dired "Dired"))))

(setq create-lockfiles nil)

(setq eldoc-echo-area-use-multiline-p nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq electric-indent-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-always-indent t)
(setq c-basic-offset 4)
(setq lisp-indent-offset 4)
(setq-default js-indent-level 4)
(setq-default typescript-indent-level 4)
(setq c-default-style "linux")
(setq-default c-indent-level 4)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
    (define-key dired-mode-map (kbd "/") 
        (lambda () (interactive) (find-alternate-file "..")))
    )

(defun indent-whole-buffer ()
    "Indent the entire buffer."
    (interactive)
    (indent-region (point-min) (point-max)))

(setq isearch-lazy-highlight nil)

(global-set-key (kbd "M-1")
    (lambda ()
        (interactive)
        (point-to-register ?1)
        (message "Saved position to register 1")))

(global-set-key (kbd "M-2")
    (lambda ()
        (interactive)
        (point-to-register ?2)
        (message "Saved position to register 2")))

(global-set-key (kbd "M-3")
    (lambda ()
        (interactive)
        (point-to-register ?3)
        (message "Saved position to register 3")))

(global-set-key (kbd "M-4")
    (lambda ()
        (interactive)
        (point-to-register ?4)
        (message "Saved position to register 4")))

(global-set-key (kbd "C-1")
    (lambda ()
        (interactive)
        (jump-to-register ?1)))

(global-set-key (kbd "C-2")
    (lambda ()
        (interactive)
        (jump-to-register ?2)))

(global-set-key (kbd "C-3")
    (lambda ()
        (interactive)
        (jump-to-register ?3)))

(global-set-key (kbd "C-4")
    (lambda ()
        (interactive)
        (jump-to-register ?4)))

(setq kill-do-not-save-duplicates t)
(setq save-interprogram-paste-before-kill nil)
(setq select-enable-clipboard t)

(defun suppress-kill-ring (orig-fun &rest args)
    "Prevent text from being saved to the kill-ring."
    (let ((kill-ring nil)
             (kill-ring-yank-pointer nil)
             (interprogram-cut-function nil))
        (apply orig-fun args)))

(advice-add 'kill-word :around #'suppress-kill-ring)
(advice-add 'backward-kill-word :around #'suppress-kill-ring)

(use-package move-text
    :ensure t
    )

(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(defun indent-region-advice (&rest ignored)
    (let ((deactivate deactivate-mark))
        (if (region-active-p)
            (indent-region (region-beginning) (region-end))
            (indent-region (line-beginning-position) (line-end-position)))
        (setq deactivate-mark deactivate)))

(advice-add 'move-text-down :after 'indent-region-advice)
(advice-add 'move-text-up :after 'indent-region-advice)


(global-set-key (kbd "M-<return>") 'indent-whole-buffer)

;; Already set for registers.
;;(global-set-key (kbd "C-1") ')
;;(global-set-key (kbd "C-2") ')
;;(global-set-key (kbd "C-3") ')
;;(global-set-key (kbd "C-4") ')

(global-set-key (kbd "C-5") 'run-build-script)
(global-set-key (kbd "C-6") 'hl-line-mode)
(global-set-key (kbd "C-7") 'query-replace)
(global-set-key (kbd "C-8") 'consult-ripgrep)
(global-set-key (kbd "C-9") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "C-0") 'kmacro-end-and-call-macro)

(global-set-key (kbd "<f1>") 'next-error)
(global-set-key (kbd "<f2>") 'previous-error)
(global-set-key (kbd "<f3>") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "<f4>") 'kmacro-end-and-call-macro)
(global-set-key (kbd "<f5>") 'run-build-script)
(global-set-key (kbd "<f6>") 'hl-line-mode)
(global-set-key (kbd "<f7>") 'query-replace)
(global-set-key (kbd "<f8>") 'dired)
(global-set-key (kbd "<f9>") #'visual-line-mode)
(global-set-key (kbd "<f10>") 'indent-whole-buffer)
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "<f12>") 'point-to-register)


