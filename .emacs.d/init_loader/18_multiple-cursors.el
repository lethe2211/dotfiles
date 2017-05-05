;;; 18_multiple-cursors.el --- multiple-cursors (input multi-line simultaneously)

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, multiple-cursors, multi-line input

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

;; multiple-cursors
(require 'multiple-cursors)
(bind-key* "C-x r t" 'mc/edit-lines)

(provide '18_multiple-cursors)
;;; 18_multiple-cursors.el ends here
