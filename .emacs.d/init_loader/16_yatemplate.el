;;; 16_yatemplate.el --- yatemplate (Template to initialize the coding)

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, template, yatemplate

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

;; yatemplate
(require 'yatemplate)
(yatemplate-fill-alist)

;; yatemplate-mode
(auto-insert-mode 1)

(defun find-file-hook--yatemplate ()
  "Make it snippet-mode so that we can test snippets."
  (when (string-match "emacs.*/templates/" buffer-file-name)
    (let ((mode major-mode))
      (snippet-mode)
      (setq-local yas--guessed-modes (list mode)))))
(add-hook 'find-file-hook 'find-file-hook--yatemplate)

(defun after-save-hook--yatemplate ()
  "Reflect yatemplate file into auto-insert-alist after saving."
  (when (string-match "emacs.*/templates/" buffer-file-name)
    (yatemplate-fill-alist)))
(add-hook 'after-save-hook 'after-save-hook--yatemplate)

(setq yas-indent-line 'fixed)

(provide '16_yatemplate)
;;; 16_yatemplate.el ends here
