;;; packages.el --- ats2 layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ryan King <RyanKing@ryans-macbookpro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst ats2-packages
  '((ats2-mode :location local)
    flycheck
    (flycheck-ats2 :toggle (configuration-layer/package-usedp 'flycheck))
    (ats2-mode :location local)))

(defun ats2/init-ats2-mode ()
  "Setup and configure ats-mode."
  (use-package ats2-mode
    :defer t
    :mode (("\\.\\(s\\|d\\)ats\\'" . ats-mode)
           ("\\.cats\\'" . c/ats-mode))))

(defun ats2/init-flycheck-ats2 ()
  "Add ats support to flycheck."
  (use-package flycheck-ats2
    :commands flycheck-ats2-setup
    :init (add-hook 'flycheck-mode-hook 'flycheck-ats2-setup)))

(defun ats2/post-init-flycheck ()
  "Add hooks so flycheck is enabled by default."
  (spacemacs/add-flycheck-hook 'ats-mode)
  (spacemacs/add-flycheck-hook 'c/ats-mode))

;;; packages.el ends here
