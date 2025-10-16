
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

(split-window-horizontally)

(setq-default cursor-type 'box)

(set-cursor-color "#40ff40")

(blink-cursor-mode 1)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(setq highlight-nonselected-windows t)
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

(set-frame-font "Liberation Mono 13" nil t)

(setq frame-title-format '("SJ the Sahil Joseph's Writing System"))

(add-to-list 'custom-theme-load-path "C:/Users/sjthesahiljoseph/projects/loveisanillusion.emacs")
(load-theme 'loveisanillusion.emacs t)

(setq inhibit-startup-message t)
(setq inhibit-message t)
(set-message-beep 'silent)
(setq initial-scratch-message "\
;; SJ the Sahil Joseph

")

(transient-mark-mode 1)

(setq mark-even-if-inactive nil)

;; flash region
;; (defun flash-region ()
;;     (interactive)
;;     (when (use-region-p)
;;         (let ((ov (make-overlay
;;                       (region-beginning) (region-end))))
;;             (overlay-put ov 'face 'isearch)
;;             (run-with-timer 0.15 nil
;;                 #'delete-overlay ov))))
;; (advice-add 'kill-ring-save :after
;;     (lambda (&rest _) (flash-region)))
;; (advice-add 'kill-region :after (lambda (&rest _) (flash-region)))

(setq-default compilation-always-kill t)
(setq-default compilation-scroll-output t)

(defun run-build-script ()
	"Run the build.bat."
	(interactive)
	(compile "build.bat"))

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

(use-package web-mode
    :ensure t
    :defer t
    :mode
    (
        ("\\.html\\'" . web-mode)
        ("\\.jsx\\'" . web-mode)
        ("\\.tsx\\'" . web-mode)
        ("\\.cshtml\\'" . web-mode)
        ("\\.css\\'" . web-mode)
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



;; Already set for registers.
;;(global-set-key (kbd "C-1") ')
;;(global-set-key (kbd "C-2") ')
;;(global-set-key (kbd "C-3") ')
;;(global-set-key (kbd "C-4") ')

;; Available
;;(global-set-key (kbd "C-5") ')
;;(global-set-key (kbd "C-6") ')
;;(global-set-key (kbd "C-7") ')
;;(global-set-key (kbd "C-8") ')
;;(global-set-key (kbd "C-9") ')
;;(global-set-key (kbd "C-0") ')

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


(global-set-key (kbd "M-<return>") 'indent-whole-buffer)






