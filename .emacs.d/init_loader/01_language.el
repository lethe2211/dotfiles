;;; 01_language.el --- 

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

;; 言語環境とか文字コードとか

;;; Code:

;言語環境
(set-language-environment "Japanese")
(setq default-input-method "MW32-IME")

;文字コード
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)

(provide '01_language)
;;; 01_language.el ends here
