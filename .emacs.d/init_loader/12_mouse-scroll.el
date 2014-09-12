;;; nw-mouse-scroll.el --- 

;; Copyright (C) 2014  admin

;; Author: admin <admin@h77.26.238.10.30790.vlan.kuins.net>
;; Keywords: 

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

;; ターミナル用のマウススクロール

;;; Code:

(xterm-mouse-mode t)
;;(mouse-wheel-mode t)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))

(provide 'nw-mouse-scroll)
;;; nw-mouse-scroll.el ends here
