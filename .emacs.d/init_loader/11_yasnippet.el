;;; 11.yasnippet.el --- 

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

;; yasnippet(スニペット管理フレームワーク)の設定

;;; Code:

;; 自分用スニペットをmySnippets，拾ってきたスニペットをsnippetsに入れる
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/mySnippets" 
        "~/.emacs.d/snippets"
        ))

;; スニペット例を有効化する
(add-to-list 'yas/root-directory "~/.emacs.d/.cask/24.3.1/elpa/yasnippet-20140909.1250/")
;; yasnippet起動
(yas-global-mode 1)

; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)

;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)

;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

(provide '11.yasnippet)
;;; 11.yasnippet.el ends here
