;;; 23_python-mode.el --- python-mode

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, major mode, python-mode

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

;; elpy (whole development environment for python-emacs)
(require 'elpy)
(elpy-enable)

;; Use flycheck for syntax check (Note: the default of elpy is flymake)
(when (require 'flycheck nil t)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide '23_python-mode)
;;; 23_python-mode.el ends here
