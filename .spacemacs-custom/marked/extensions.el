;;; extensions.el --- marked Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar marked-pre-extensions
  '(
    ;; pre extension markeds go here
    )
  "List of all extensions to load before the packages.")

(defvar marked-post-extensions
  '(
    ;; post extension markeds go here
    marked
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function marked/init-<extension-marked>
;;
;; (defun marked/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun marked/init-marked ()
  "Initialize Marked"
  (use-package marked
    :commands (marked/markdown-preview-file)
    :init
    (progn
      (evil-leader/set-key
        "om" 'marked/markdown-preview-file
        ))))
