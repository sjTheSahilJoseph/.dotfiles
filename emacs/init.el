
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(setq echo-keystrokes nil)
(global-hl-line-mode 0)
(column-number-mode t)
(when (bound-and-true-p tooltip-mode)
    (tooltip-mode -1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(split-window-horizontally)

(setq-default cursor-type 'box)
(set-cursor-color "#40ff40")
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(setq highlight-nonselected-windows nil)
(setq-default cursor-in-non-selected-windows nil)

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


(use-package markdown-mode
	:ensure t
	:defer t
	)


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
    (
        ("\\.jsx\\'" . web-mode)
        ("\\.tsx\\'" . web-mode)
        ("\\.html\\'" . web-mode)
        ("\\.css\\'" . web-mode)
        )
    )

(use-package emmet-mode
    :ensure t
    :defer t
    )

(add-hook 'web-mode-hook 'emmet-mode)

(defvar my/html-class-overlay-list nil
    "List of overlays hiding long class attributes.")

(defvar my/html-class-names-hidden nil
    "Flag to track whether class names are currently hidden.")

(defun my/html-toggle-long-class-names ()
    "Toggle visibility of long class or className attributes in web-mode."
    (interactive)
    (if my/html-class-names-hidden
        (progn
            (mapc #'delete-overlay my/html-class-overlay-list)
            (setq my/html-class-overlay-list nil)
            (setq my/html-class-names-hidden nil)
            )
        (save-excursion
            (goto-char (point-min))
            (setq my/html-class-overlay-list nil)
            (let ((count 0))
                (while (re-search-forward
                           "\\(class\\|className\\)=\\(?:\"\\([^\"]\\{20,\\}\\)\"\\|{\\(?:\"\\([^\"]\\{20,\\}\\)\"\\|`\\([^`]\\{20,\\}\\)`\\)}\\)"
                           nil t)
                    (let ((start (or (match-beginning 2) (match-beginning 3) (match-beginning 4)))
                             (end   (or (match-end 2)     (match-end 3)     (match-end 4))))
                        (when (and start end)
                            (let ((ov (make-overlay start end)))
                                (overlay-put ov 'invisible t)
                                (push ov my/html-class-overlay-list)
                                (setq count (1+ count))))))
                (setq my/html-class-names-hidden t)
                ))))

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
    (define-key web-mode-map (kbd "C-c t") #'my/html-toggle-long-class-names)
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

(global-set-key (kbd "C-<tab>") 'indent-region)

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

(global-set-key (kbd "<f1>") 'next-error)
(global-set-key (kbd "<f2>") 'previous-error)
(global-set-key (kbd "<f3>") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "<f4>") 'kmacro-end-and-call-macro)
(global-set-key (kbd "<f5>") 'run-build-script)
(global-set-key (kbd "<f6>") 'hl-line-mode)
(global-set-key (kbd "<f7>") 'query-replace)
(global-set-key (kbd "<f8>") 'eval-region)
(global-set-key (kbd "<f9>") #'visual-line-mode)
(global-set-key (kbd "<f10>") 'indent-whole-buffer)
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "<f12>") 'point-to-register)

(define-prefix-command 'my-position-map)
(global-set-key (kbd "C-c p") 'my-position-map)

(define-key my-position-map (kbd "s 1")
    (lambda () (interactive)
        (point-to-register ?1)
        (message "Saved position to register 1")))

(define-key my-position-map (kbd "s 2")
    (lambda () (interactive)
        (point-to-register ?2)
        (message "Saved position to register 2")))

(define-key my-position-map (kbd "s 3")
    (lambda () (interactive)
        (point-to-register ?3)
        (message "Saved position to register 3")))


(define-key my-position-map (kbd "s 4")
    (lambda () (interactive)
        (point-to-register ?4)
        (message "Saved position to register 4")))

(define-key my-position-map (kbd "j 1")
    (lambda () (interactive)
        (jump-to-register ?1)))

(define-key my-position-map (kbd "j 2")
    (lambda () (interactive)
        (jump-to-register ?2)))


(define-key my-position-map (kbd "j 3")
    (lambda () (interactive)
        (jump-to-register ?3)))

(define-key my-position-map (kbd "j 4")
    (lambda () (interactive)
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

(defun my/pulse-line-or-region ()
    "Pulse the current line if no region is selected, or pulse the region if selected."
    (interactive)
    (if (use-region-p)
        (pulse-momentary-highlight-region (region-beginning) (region-end))
        (pulse-momentary-highlight-one-line (line-beginning-position))))

(global-set-key (kbd "C-<return>") 'my/pulse-line-or-region)

(use-package ido
    :init
    (setq ido-enable-flex-matching t
        ido-max-window-height 1
        ido-everywhere t)
    :config

    (define-key ido-completion-map (kbd "<backtab>") 'ido-prev-match)
    (define-key ido-completion-map (kbd "<tab>") 'ido-next-match) 

    (ido-mode 1))

(use-package ido-completing-read+
    :ensure t
    :config
    (ido-ubiquitous-mode 1))


(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer-other-window)

(global-set-key (kbd "C-1") 'next-error)
(global-set-key (kbd "C-2") 'previous-error)
(global-set-key (kbd "C-3") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "C-4") 'kmacro-end-and-call-macro)
(global-set-key (kbd "C-5") 'run-build-script)
(global-set-key (kbd "C-6") 'hl-line-mode)
(global-set-key (kbd "C-7") 'query-replace)
(global-set-key (kbd "C-8") 'eval-region)
(global-set-key (kbd "C-9") 'visual-line-mode)
(global-set-key (kbd "C-0") 'indent-whole-buffer)



