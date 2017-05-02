;;; 15_quickrun.el --- quickrun (shortcut for running the current buffer)

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, quickrun

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

(require 'quickrun)

(bind-key "C-c C-c" 'quickrun global-map)
(bind-key "C-c C-v" 'quickrun-with-arg global-map)

(provide '15_quickrun.el)
;;; 15_quickrun.el ends here
