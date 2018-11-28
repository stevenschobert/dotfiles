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

;; Helm
(use-package helm
  :ensure t
  :config
  (helm-mode t)
  (setq helm-buffers-fuzzy-matching t))

;; Evil stuff
(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "w"  'save-buffer
    "b"  'helm-mini                     ;; Open other buffers using Helm
    "o"  'delete-other-windows          ;; Close all other windows
    ","  'other-window                  ;; Switch to other window
    "d"  'kill-this-buffer
    "l"  'whitespace-mode               ;; Toggle invisible characters
    "S"  'delete-trailing-whitespace)
  (global-evil-leader-mode))

;; Copy/paste
(use-package simpleclip
  :ensure t
  :config
  (simpleclip-mode))

;; Flycheck
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))
(use-package add-node-modules-path
  :ensure t
  :config
  (add-hook 'js-mode-hook 'add-node-modules-path))
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; Languages
(use-package markdown-mode
  :ensure t)
(use-package swift-mode
  :ensure t)
(use-package graphql-mode
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
(setq js-indent-level 2)
(setq css-indent-offset 2)

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
    (spaceline atom-one-dark-theme swift-mode evil use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 160 :family "Inconsolata")))))
