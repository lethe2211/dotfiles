;;; 01_setting.el --- 

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

;; Emacs全体の設定

;;; Code:

;ロードパスの追加
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;フォント
;(set-face-font 'default "Takaoゴシック 16")
;(set-default-font "Takaoゴシック")

;起動時の画面を表示しない
(setq inhibit-splash-screen t)

;メニューバーを表示しない
(menu-bar-mode 0)

;ツールバーを表示しない
;(tool-bar-mode 0)

; 選択部分のハイライト
(transient-mark-mode t) 

;対応カッコのハイライト
(show-paren-mode t)

;; yes or noでなく，y or nで答えられるようにする
(defalias 'yes-or-no-p 'y-or-n-p)

;バックアップファイルは作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;カーソルがどの関数の中にあるかをモードラインに表示する
(which-function-mode 1)

;; スムーズなスクロール
;; (require 'smooth-scroll)
;; (smooth-scroll-mode t)

;行番号表示
(require 'hlinum)
(hlinum-activate)
;; 前景色を黒，背景色を赤にする．
(custom-set-faces
 '(linum-highlight-face ((t (:foreground "black"
                             :background "yellow")))))
(custom-set-variables 
 '(global-linum-mode t))

;; helmの設定
(global-set-key (kbd "C-c h") 'helm-mini)
;;(helm-mode 1)
;;(custom-set-variables '(helm-ff-auto-update-initial-value nil))
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;; ELPAの設定
;; M-x package-installで好きなパッケージをインストールできる
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
	       '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize))

(provide '01_setting)
;;; 01_setting.el ends here
