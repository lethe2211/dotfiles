;;; 10_flycheck.el --- flycheck (auto-completion) configuration

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, flycheck, auto-completion

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

;; global setting
(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-cask
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))

;; Jump to the next/previous error
(bind-key* "C-c C-p" 'flycheck-previous-error 'flycheck-mode-map)
(bind-key* "C-c C-n" 'flycheck-next-error 'flycheck-mode-map)

(provide '10_flycheck)
;;; 10_flycheck.el ends here
