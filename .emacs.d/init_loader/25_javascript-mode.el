;;; 25_javascript-mode.el --- javascript-mode

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, major mode, js2--mode

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

;; js2-mode (for *.js)
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$\\'" . js2-mode))

;; js2-jsx-mode (for *.jsx)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(add-hook 'js2-jsx-mode-hook 'flycheck-mode)
(add-hook 'js2-jsx-mode-hook 'emmet-mode)

(provide '25_javascript-mode)
;;; 25_javascript-mode.el ends here
