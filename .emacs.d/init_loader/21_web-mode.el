;;; 21_web-mode.el --- 

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

;; web-modeの設定

;;; Code:

(when (require 'web-mode nil t)
  ;; 自動的にWeb-modeを起動したい拡張子を追加する
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'a
	       uto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  ;; Web-modeのインデント設定用フック
  (defun Web-mode-hook ( )
    "Hooks for Web mode."
    (setq Web-mode-markup-indent-offset 2) ; HTMLのインデント
    (setq Web-mode-css-indent-offset 2)	   ; CSSのインデント
    (setq Web-mode-code-indent-offset 2) ; JS, PHP, Rubyなどのインデント
    (setq Web-mode-comment-style 2)	 ; Web-mode内のコメントのインデント
    (setq Web-mode-style-padding 1)	   ; <style>内のインデント開始レベル
    (setq Web-mode-script-padding 1)	   ; <script>内のインデント開始レベル
    )
  (add-hook 'Web-mode-hook 'Web-mode-hook)
)


(provide '21_web-mode)
;;; 21_web-mode.el ends here
