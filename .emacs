(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package exec-path-from-shell
  :ensure t
  :config
  (if (eq system-type 'darwin)
      (exec-path-from-shell-initialize))
  )

;; Helm
(use-package helm
  :ensure t
  :config
  (helm-mode t)
  (setq helm-buffers-fuzzy-matching t))
(use-package helm-projectile
  :after projectile helm
  :ensure t
  :config
  (helm-projectile-on))
(use-package helm-ag
  :after helm
  :ensure t)

;; Evil stuff
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (if (eq system-type 'windows-nt)
    (setq load-path (remove (expand-file-name "~/.emacs.d/elpa/undo-tree-0.6.5") load-path)) ;; Windows-specific bug with undo-tree https://github.com/emacs-evil/evil/issues/1074
  )
  :config
  (evil-mode t))

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "w"  'save-buffer
    "o"  'delete-other-windows
    "c"  'comment-line
    "b"  'helm-mini
    "f"  'helm-projectile-find-file
    "p"  'helm-projectile-switch-project
    "s"  'helm-projectile-ag
    "d"  'kill-this-buffer
    "n"  'treemacs
    "j"  'evil-window-down
    "k"  'evil-window-up
    "h"  'evil-window-left
    "l"  'evil-window-right
    "x"  'evil-window-delete)
  (global-evil-leader-mode))

;; Projectile
(use-package projectile
  :ensure t
  :config
  (setq projectile-project-search-path '("~/code/"))
  (projectile-mode))

;; Copy/paste
(if (eq system-type 'darwin)
  (use-package simpleclip
    :ensure t
    :config
    (simpleclip-mode))
)

;; Treemacs
(use-package treemacs
  :ensure t
  :config
  (treemacs-follow-mode t)
  (setq treemacs-width 30)
  (if (eq system-type 'windows-nt)
      (setq treemacs-python-executable "C:\\Python37\\python.exe")
      ))
(use-package treemacs-evil
  :after treemacs evil
  :ensure t)
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)
(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config
  (treemacs-icons-dired-mode))

;; Flycheck
(use-package add-node-modules-path
  :ensure t
  :config
  (add-hook 'js-mode-hook 'add-node-modules-path))
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))
(use-package flymake-go
  :after flycheck
  :ensure t)

;; Languages
(use-package markdown-mode
  :ensure t)
(use-package swift-mode
  :ensure t)
(use-package graphql-mode
  :ensure t)
(use-package go-mode
  :ensure t
  :init
  (if (eq system-type 'windows-nt)
      (setq exec-path (append exec-path '(concat (getenv "GOPATH") "\bin")))
    )
  :config
  (add-hook 'before-save-hook #'gofmt-before-save))
(use-package yaml-mode
  :ensure t)

;; Appearances
(use-package atom-one-dark-theme
  :ensure t
  :config
  (load-theme 'atom-one-dark t))
(use-package dimmer
  :ensure t
  :config
  (setq dimmer-fraction 0.33)
  (setq dimmer-exclusion-regexp "^\*helm.*\\|^ \*Minibuf-.*\\|^ \*Echo.*")
  (dimmer-mode))

;; Spaceline
(use-package spaceline
  :ensure t
  :config
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode))

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq js-indent-level 2)
(setq css-indent-offset 2)

;; Working directory
(setq default-directory "~/")

;; Emacs server config
(setq server-socket-dir (expand-file-name "server" user-emacs-directory))
(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(mac-command-modifier (quote super))
 '(mac-option-modifier (quote meta))
 '(package-selected-packages
   (quote
    (flymake-go go-mode spaceline atom-one-dark-theme swift-mode evil use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(if (eq system-type 'windows-nt)
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:height 140 :family "InconsolataGo NF")))))
)
(if (eq system-type 'darwin)
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:height 160 :family "InconsolataGo Nerd Font")))))
)
