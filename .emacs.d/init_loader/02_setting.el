;;; 02_setting.el --- Emacs whole setting

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

;; Add load-path to add any elisp files
(add-to-list 'load-path "~/dotfiles/.emacs.d/site-lisp")

;; Not display splash screen
(setq inhibit-splash-screen t)

;; Not display menu bar
(menu-bar-mode 0)

;; Highlight the corresponding parenthesis
(show-paren-mode t)

;; Modify the answer: yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Not create backup files
(setq make-backup-files nil)

;; Not create auto-save files
(setq auto-save-default nil)

;; Display in which function we are in the mode line
(which-function-mode 1)

;; Display line numbers (hlinum-mode)
(require 'hlinum)
(hlinum-activate)
(setq linum-format "%5d ") 		; Keep 5 characters from the line head for linum
(global-linum-mode 1)

;; Make foreground color black and background color yellow
(custom-set-faces
 '(linum-highlight-face ((t (:foreground "black"
					 :background "yellow")))))

;; melpa/ELPA
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
	       '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize))

;; exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

;; emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

(provide '02_setting)
;;; 02_setting.el ends here
