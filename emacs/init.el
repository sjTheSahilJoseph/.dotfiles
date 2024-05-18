
;; Startup Screen
(setq inhibit-startup-message t)

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
(global-hl-line-mode 0)
(split-window-horizontally)
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
                    :family "Consolas"
                    :height 120
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

;; Compile
(defun run-build-script ()
  "Run the build.bat"
  (interactive)
  (compile "build.bat"))
(global-set-key (kbd "<f5>") 'run-build-script)

;; Indent
(setq electric-indent-mode t)
(setq-default tab-width 4)
(defun insert-tab ()
  "Insert a tab at point, unless in minibuffer."
  (interactive)
  (if (minibufferp)
      (call-interactively 'minibuffer-complete)
    (insert "\t")))
(defun delete-tab-or-char-backward ()
  "Delete the preceding tab or one character if no tabs are present."
  (interactive)
  (if (minibufferp)
      (call-interactively 'delete-backward-char)
    (if (not (bolp))
        (if (char-equal (char-before) ?\t)
            (delete-char -1)
          (backward-delete-char 1))
      (backward-delete-char 1))))
(global-set-key (kbd "<tab>") 'insert-tab)
(global-set-key (kbd "<backspace>") 'delete-tab-or-char-backward)
(setq-default c-basic-offset tab-width)
(setq-default js-indent-level tab-width)
(setq-default css-indent-offset tab-width)

;; Sound
(set-message-beep 'silent)

;; Open dotfiles
(defun open-dotfiles ()
  "Open /.dotfiles in a new window."
  (interactive)
  (find-file-other-window "c:/users/sjthe/.dotfiles"))

;; Open Projects
(defun open-projects ()
  "Open /Projects."
  (interactive)
  (find-file-other-window "c:/users/sjthe/Projects"))

;; Sj's Keymaps
(defun setup-my-keybindings ()
  "Set up personal keybindings."
  (interactive)
  (defvar my-prefix-map (make-sparse-keymap)
    "My personal prefix keymap.")
  (define-key my-prefix-map (kbd "d") 'open-dotfiles)
    (define-key my-prefix-map (kbd "p") 'open-projects)
  (global-set-key (kbd "C-c m") my-prefix-map)
  )
(setup-my-keybindings)


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

(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-mode))


(use-package json-mode
  :ensure t
  :defer t)

(use-package typescript-mode
  :ensure t
  :defer t)

(use-package web-mode
	:ensure t
	:defer t)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-auto-pairing nil)

(use-package emmet-mode
  :ensure t
  :hook ((sgml-mode html-mode css-mode web-mode) . emmet-mode)
  :config
  (define-key emmet-mode-keymap (kbd "C-j") 'emmet-expand-line))


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
 '(package-selected-packages '(json-mode rainbow-mode)))
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
0 '(org-level-7 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#c6c6c6" :font "Consolas")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
