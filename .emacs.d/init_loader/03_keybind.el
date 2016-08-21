;;; 03_keybind.el --- 

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

;; キーバインドの設定

;;; Code:

(require 'bind-key)

;C-hでカーソル前の1文字を消す(BackSpace)
(bind-key* "\C-h" 'delete-backward-char)

;M-gで入力した行にジャンプする
(bind-key* "M-g" 'goto-line)

;Ctrl+Meta+vで1ページ上にスクロールする(デフォルトのM-vだと端末とキーバインドが競合する)
(bind-key* "C-M-v" 'scroll-down)

;Meta+nで2行下，Meta+pで2行上に移動
(bind-key* "\M-n" '(lambda ()
			   (interactive)
			   (next-line 2)))
(bind-key* "\M-p" '(lambda ()
                           (interactive)
			   (previous-line 2)))

;; C-tでウィンドウの切り替え
(bind-key* "\C-t" 'other-window)

(bind-key* "\C-x \C-f" 'helm-find-files)

(provide '03_keybind)
;;; 03_keybind.el ends here
