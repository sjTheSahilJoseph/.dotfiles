
;; Startup Screen
(setq inhibit-startup-message t)

;; Stop Messages
(setq inhibit-message t)
;; Beginning and End of Buffer Message
(defadvice previous-line (around silencer activate)
	(condition-case nil
		ad-do-it
		((beginning-of-buffer))))

(defadvice next-line (around silencer activate)
	(condition-case nil
		ad-do-it
		((end-of-buffer))))



;; Scratch Buffer Message
(setq initial-scratch-message "\
;; SJ's Emacs

")

;; Start in maximized mode
(defun maximize-frame ()
	"Maximizes the active frame in Windows"
	(interactive)
	(when (eq system-type 'windows-nt)
		(w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)

;; Basic UI changes
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'box)
(set-cursor-color "#26d726")
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(global-hl-line-mode 0)
(split-window-horizontally)
(column-number-mode t)
(setq-default truncate-lines t)

;; Marking
(setq mark-even-if-inactive nil)
(transient-mark-mode -1)
(defun my-copy-region-as-kill-no-move (beg end)
	"Copy the region as kill without moving the cursor."
	(interactive "r")
	(let ((deactivate-mark nil))
		(save-excursion
			(copy-region-as-kill beg end))))
(global-set-key (kbd "M-w") 'my-copy-region-as-kill-no-move)

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
    :family "Consolas"
    :height 130
    :weight 'regular)

;; Default directory
(setq default-directory "C:/Users/sjthe/") 

;; Theme Stuff
(add-to-list 'custom-theme-load-path "C:/Users/sjthe/.dotfiles/emacs/themes/")
(load-theme 'loveisanillusion.emacs t)

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

;; Compile
(defun run-build-script ()
	"Run the build.bat"
	(interactive)
	(compile "build.bat"))
(global-set-key (kbd "<f5>") 'run-build-script)

;; Sound
(set-message-beep 'silent)

;; Buffer Navigation
(defun next-file-buffer ()
	"Switch to the next file buffer. Do nothing if the current buffer is not a file buffer."
	(interactive)
	(if (and (buffer-file-name) (file-readable-p (buffer-file-name)))
		(let ((start-buffer (current-buffer)))
			(next-buffer)
			(while (and (not (eq (current-buffer) start-buffer))
                       (not (and (buffer-file-name) (file-readable-p (buffer-file-name)))))
				(next-buffer)))
		(message "Current buffer is not a file buffer.")))

(defun previous-file-buffer ()
	"Switch to the previous file buffer. Do nothing if the current buffer is not a file buffer."
	(interactive)
	(if (and (buffer-file-name) (file-readable-p (buffer-file-name)))
		(let ((start-buffer (current-buffer)))
			(previous-buffer)
			(while (and (not (eq (current-buffer) start-buffer))
                       (not (and (buffer-file-name) (file-readable-p (buffer-file-name)))))
				(previous-buffer)))
		(message "Current buffer is not a file buffer.")))

(global-set-key (kbd "<left>") 'previous-file-buffer)
(global-set-key (kbd "<right>") 'next-file-buffer)


;; Open dotfiles
(defun open-dotfiles ()
	"Open /.dotfiles."
	(interactive)
	(find-file-other-window "c:/users/sjthe/.dotfiles"))

;; Open Projects
(defun open-projects ()
	"Open /Projects."
	(interactive)
	(find-file-other-window "c:/users/sjthe/Projects"))

;; Open Init file
(defun open-init-file ()
	"Open init file."
	(interactive)
	(find-file-other-window "c:/users/sjthe/.dotfiles/emacs/init.el"))

;; Open Theme File
(defun open-theme-file ()
	"Open theme file."
	(interactive)
	(find-file-other-window "C:/Users/sjthe/.dotfiles/emacs/themes/loveisanillusion.emacs-theme.el"))

;; Quick Open Directories Keymaps
(defun setup-directories-keybindings ()
	"Open Directories."
	(interactive)
	(defvar my-prefix-map (make-sparse-keymap)
		"My personal prefix keymap.")
	(define-key my-prefix-map (kbd "d") 'open-dotfiles)
	(define-key my-prefix-map (kbd "e") 'open-init-file)
	(define-key my-prefix-map (kbd "p") 'open-projects)
	(define-key my-prefix-map (kbd "t") 'open-theme-file)
	(global-set-key (kbd "C-c m") my-prefix-map)
	)
(setup-directories-keybindings)

;; Package Stuff ... coming ...
(require 'package)
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
        warning-minimum-level :error)
	)

(use-package json-mode
	:ensure t
	:defer t)

(use-package typescript-mode
	:ensure t
	:defer t)

(use-package cc-mode
	:ensure t
	:defer t)

(use-package python-mode
	:ensure t
	:defer t)

(use-package kotlin-mode
	:ensure t
	:defer t)


;; Indent
(setq electric-indent-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)
(setq-default js-indent-level tab-width)
(setq-default python-indent-offset tab-width)
(setq lisp-indent-offset 4)
(setq lisp-body-indent 4)

(defun indent-whole-buffer ()
	"Indent the entire buffer."
	(interactive)
	(save-excursion
		(indent-region (point-min) (point-max) nil)))

(global-set-key (kbd "<f8>") 'indent-whole-buffer)


;; Transpose Lines and Regions
(defun move-text-internal (arg)
	"Move the region (if active) or the current line by ARG lines."
	(cond
		((and mark-active transient-mark-mode)
			(let ((region-start (region-beginning))
					 (region-end (region-end)))
				(let ((text (delete-and-extract-region region-start region-end)))
					(forward-line arg)
					(insert text)
					;; Adjust mark to new region
					(set-mark (point))
					(exchange-point-and-mark)
					(setq deactivate-mark nil))))
		(t
			(let ((column (current-column)))
				(beginning-of-line)
				(when (or (> arg 0) (not (bobp)))
					(forward-line)
					(when (or (< arg 0) (not (eobp)))
						(transpose-lines arg))
					(forward-line -1))
				(move-to-column column t)))))

(defun move-text-down (arg)
	"Move region (transient-mark-mode active) or current line by ARG lines down."
	(interactive "*p")
	(move-text-internal arg))

(defun move-text-up (arg)
	"Move region (transient-mark-mode active) or current line by ARG lines up."
	(interactive "*p")
	(move-text-internal (- arg)))

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; ORG MODE
(require 'org)
(setq org-log-done 'time)
(setq org-return-follows-link  t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-hide-emphasis-markers t)
(add-hook 'org-mode-hook 'visual-line-mode)

(let* ((variable-tuple
           (cond ((x-list-fonts "Consolas")         '(:font "Consolas"))
               ((x-list-fonts "Consolas") '(:font "Consolas"))
               ((x-list-fonts "Consolas")   '(:font "Consolas"))
               ((x-list-fonts "Consolas")         '(:font "Consolas"))
               ((x-family-fonts "Consolas")    '(:family "Consolas"))
               (nil (warn "Cannot find font."))))
		  (base-font-color     (face-foreground 'default nil 'default))
		  (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

	(custom-theme-set-faces
		'user
		`(org-level-8 ((t (,@headline ,@variable-tuple))))
		`(org-level-7 ((t (,@headline ,@variable-tuple))))
		`(org-level-6 ((t (,@headline ,@variable-tuple))))
		`(org-level-5 ((t (,@headline ,@variable-tuple))))
		`(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
		`(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
		`(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
		`(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
		`(org-document-title ((t (,@headline ,@variable-tuple :height 1.6 :underline t))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(kotlin-mode typescript-mode python-mode json-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas" :height 1.6 :underline t))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas" :height 1.5))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas" :height 1.3))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas" :height 1.2))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas")))))
