
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

;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-files-by-mouse-dragging    t
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   t
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                0
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               30
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

	(pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  

  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-tab-bar
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

(setq treemacs-follow-mode t)
(setq treemacs-project-follow-mode t)

(use-package treemacs-projectile
  :ensure t
  :defer t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))

(defun my-treemacs-refresh-on-project-change ()
  "Refresh treemacs and switch to the current project."
  (interactive)
  (when (project-current)
    (treemacs-add-and-display-current-project)))
(add-hook 'projectile-switch-project-hook #'my-treemacs-refresh-on-project-change)

(setq treemacs-project-follow-mode t)
(setq treemacs-follow-mode t)
(setq treemacs-is-never-other-window t)
(defun my-treemacs-update-project-root ()
  "Update Treemacs to show the correct project root, even when switching disks."
  (let* ((current-dir (file-truename default-directory))
         (project-root (if (project-current)
                           (project-root (project-current))
                         current-dir)))
    (treemacs-display-current-project-exclusively)
    (treemacs-select-window)
    (treemacs-find-file project-root)))

(add-hook 'find-file-hook #'my-treemacs-update-project-root)

(add-hook 'projectile-after-switch-project-hook #'my-treemacs-update-project-root)


;; LSP
(use-package lsp-mode
  :ensure t
  :defer t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (typescript-mode . lsp)
		 (rust-mode . lsp)
		 (python-mode . lsp)
         )
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(lsp-treemacs-sync-mode 1)


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




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treemacs-projectile typescript-mode treemacs-tab-bar treemacs-icons-dired rust-mode rainbow-mode python-mode lua-mode lsp-ui lsp-treemacs lsp-ivy json-mode helm-lsp flycheck company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
