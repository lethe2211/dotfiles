;;; 02_setting.el --- 

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

;起動時の画面を表示しない
(setq inhibit-splash-screen t)

;メニューバーを表示しない
(menu-bar-mode 0)

;対応カッコのハイライト
(show-paren-mode t)

;; yes or noでなく，y or nで答えられるようにする
(defalias 'yes-or-no-p 'y-or-n-p)

;バックアップファイルは作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;カーソルがどの関数の中にあるかをモードラインに表示する
(which-function-mode 1)

;行番号表示
(require 'hlinum)
(hlinum-activate)

;; 前景色を黒，背景色を赤にする．
(custom-set-faces
 '(linum-highlight-face ((t (:foreground "black"
                             :background "yellow")))))
(custom-set-variables 
 '(global-linum-mode t))

;; Settings for power-line
(require 'powerline)
(powerline-vim-theme)

;; helmの設定
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

;; ELPAの設定
;; M-x package-installで好きなパッケージをインストールできる
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
	       '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize))

;; exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

;; emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

(provide '02_setting)
;;; 02_setting.el ends here
