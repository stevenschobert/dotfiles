;; Set some initial UI options
(tool-bar-mode -1) ;; Hide the outdated icons
(scroll-bar-mode -1) ;; Hide the always visible scroll bar
(setq inhibit-splash-screen t) ;; Remove the "Welcome to Emacs" splash screen
(setq use-file-dialog nil) ;; Ask for textual confirmation instead of GUI

;; straight.el install
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; install use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)  ; use straight.el by default
(setq use-package-always-defer t)         ; enable lazy loading

;; Garbage collector magic hack speed boost
(use-package gcmh
  :demand
  :config
  (gcmh-mode 1))

;; core emacs configs
(use-package emacs
  :init

  ;; disable auto-save files
  (setq auto-save-default nil)

  ;; hide help message on initial buffer
  (setq initial-scratch-message nil)
  (defun display-startup-echo-area-message ()
    (message ""))

  ;; type y or n in confirmation prompts
  (defalias 'yes-or-no-p 'y-or-n-p)

  ;; use utf-8 everywhere
  (set-charset-priority 'unicode)
  (setq locale-coding-system 'utf-8
        coding-system-for-read 'utf-8
        coding-system-for-write 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix))

  ;; use spaces, but configure tab-width for modes that use tabs
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)

  ;; use a more standard cursor indicator
  (setq-default cursor-type 'bar)

                                        ; map keybindings for macOS
  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'super)
    (setq mac-option-modifier 'meta)
    (setq mac-control-modifier 'control)

    ;; set font for macos
    (set-face-attribute 'default nil
                        :font "MonoLisa Nerd Font"
                        :height 140))

  ;; don't use escape as a modifier
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  
  ;; enable line numbers 
  (defun ab/enable-line-numbers ()
    "Enable line numbers"
    (interactive)
    (display-line-numbers-mode)
    (setq display-line-numbers t))
  (add-hook 'prog-mode-hook #'ab/enable-line-numbers))

;; setup evil-mode
(use-package evil
  :demand
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

;; setup doom-themes
(use-package doom-themes
  :demand
  :config
  (load-theme 'doom-tomorrow-night t))

;; setup doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; setup nerd-icons
(use-package nerd-icons)

;; show key bindings as you type
(use-package which-key
  :demand
  :init
  (setq which-key-idle-delay 0.5) ; wait half a second to open
  :config
  (which-key-mode))

;; setup keybindings via general.el
(use-package general
  :demand
  :config
  (general-evil-setup)

  (general-create-definer leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  (leader-keys
    "x" '(execute-extendend-command :which-key "execute command")
    "r" '(restart-emacs :which-key "restart emacs")
    "i" '((lambda () (interactive) (find-file user-init-file)) :which-key "open init file")

    ;; buffer
    "b" '(:ignore t :whick-key "buffer")
    ;; Dont' show an error because SPC b ESC is undefined
    "b <escape>" '(keyboard-escape-quit :which-key t)
    "bd" 'kill-current-buffer))

;; setup projectile
(use-package projectile
  :demand
  :general
  (leader-keys
    :states 'normal
    "SPC" '(projectile-find-file :which-key "find file")

    ;; Buffers
    "b b" '(projectile-switch-to-buffer :which-key "switch buffer")

    ;; Projects
    "p" '(:ignore t :which-key "projects")
    "p <escape>" '(keyboard-escape-quit :which-key t)
    "p p" '(projectile-switch-project :which-key "switch project")
    "p a" '(projectile-add-known-project :which-key "add project")
    "p r" '(projectile-remove-known-project :which-key "remove project"))
  :init
  (projectile-mode +1))

;; fuzzy-finding
(use-package ivy
  :config
  (ivy-mode))

;; integrated terminal
(use-package vterm)
(use-package vterm-toggle
  :general
  (leader-keys
    "'" '(vterm-toggle :which-key "terminal")))

;; similar to commentary.vim
(use-package evil-nerd-commenter
  :general
  (general-nvmap
    "gc" 'evilnc-comment-operator))
