;;; init.el --- First file to be loaded

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

;; emacs-version predicates

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq emacs22 (string-match "^22" emacs-version)
      emacs23 (string-match "^23" emacs-version)
      emacs24 (string-match "^24" emacs-version)
      emacs25 (string-match "^25" emacs-version))

;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

;; Load Cask
(when darwin-p
  (require 'cask)
  (cask-initialize))

(when linux-p
  (require 'cask "~/.cask/cask.el")
  (require 'eieio)
  (cask-initialize))

;; Load a sub directory using init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(setq init-loader-byte-compile t)
(init-loader-load "~/.emacs.d/init_loader")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum-highlight-face ((t (:foreground "black" :background "yellow"))))
 '(magit-diff-added ((t (:foreground "#22aa22"))))
 '(magit-diff-added-highlight ((t (:background "black" :foreground "#22aa22"))))
 '(magit-diff-base ((t (:foreground "#aaaa11"))))
 '(magit-diff-base-highlight ((t (:foreground "#aaaa11"))))
 '(magit-diff-context-highlight ((t (:background "black" :foreground "grey50"))))
 '(magit-diff-hunk-heading ((t (:foreground "grey30"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "black" :foreground "grey30"))))
 '(magit-diff-removed ((t (:foreground "#aa2222"))))
 '(magit-diff-removed-highlight ((t (:background "black" :foreground "#aa2222"))))
 '(magit-section-highlight ((t (:background "black")))))

(provide 'init)
;;; init.el ends here
