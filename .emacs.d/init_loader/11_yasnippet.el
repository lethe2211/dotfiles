;;; 11_yasnippet.el --- yasnippet (code snippet tool) configuration

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, snippet, yasnippet

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

(require 'yasnippet)

;; yasnippet
(yas-global-mode 1)

;; Insert an existing snippet
(bind-key "C-x i i" 'yas-insert-snippet yas-minor-mode-map)

;; Prepare a buffer to create a new snippet
(bind-key "C-x i n" 'yas-new-snippet yas-minor-mode-map)

;; See/Edit an existing snippet
(bind-key  "C-x i v" 'yas-visit-snippet-file yas-minor-mode-map)

(provide '11_yasnippet)
;;; 11_yasnippet.el ends here
