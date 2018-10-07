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
    "o"  'delete-other-windows
    ","  'other-window
    "d"  'kill-this-buffer)
  (global-evil-leader-mode))

;; Languages
(use-package markdown-mode
  :ensure t)
(use-package swift-mode
  :ensure t)

;; Appearances
(use-package dracula-theme
  :ensure t)

(use-package powerline
  :ensure t
  :config
  (setq powerline-image-apple-rgb t) ;; Fixes separator colors. See https://github.com/milkypostman/powerline/issues/99
  (powerline-default-theme))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (swift-mode dracula-theme evil use-package)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
