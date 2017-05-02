;;; 14_anzu.el --- anzu (better search feature) configuration

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, search, replace, anzu

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

(require 'anzu)

(global-anzu-mode 1)

(custom-set-variables
 '(anzu-mode-lighter "")		; Display minor mode name for anzu
 '(anzu-deactivate-region t)		; Disable region highlight just after a region replace
 '(anzu-search-threshold 1000))		; Maximum number of matches

;; Replace the existing key binds for search/replace with the anzu key binds
(bind-key "M-%" 'anzu-query-replace)
(bind-key "C-M-%" 'anzu-query-replace-regexp)

(provide '14_anzu)
;;; 14_anzu.el ends here
