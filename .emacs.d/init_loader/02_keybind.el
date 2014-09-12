;;; 02_keybind.el --- 

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

;C-hでカーソル前の1文字を消す(BackSpace)
(global-set-key "\C-h" 'delete-backward-char)

;M-gで入力した行にジャンプする
(global-set-key (kbd "M-g") 'goto-line)

;Ctrl+Meta+vで1ページ上にスクロールする(デフォルトのM-vだと端末とキーバインドが競合する)
(global-set-key (kbd "C-M-v") 'scroll-down)

;Meta+nで2行下，Meta+pで2行上に移動
(global-set-key "\M-n" '(lambda ()
			   (interactive)
			   (next-line 2)))
(global-set-key "\M-p" '(lambda ()
			  (interactive)
			  (previous-line 2)))

;; C-tでウィンドウの切り替え
(global-set-key "\C-t" 'other-window)

;; (xterm-mouse-mode t)
;; (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 1)))
;; (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up   1)))

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

(provide '02_keybind)
;;; 02_keybind.el ends here
