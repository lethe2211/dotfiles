;;; 99_garbage.el --- 

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

;; ゴミ箱

;;; Code:

;autoinsert
;テンプレートは~/emacs.d/templateに置く
(setq auto-insert-directory "~/.emacs.d/template/")
(load "autoinsert" t)
(setq auto-insert-alist
      (cons '("\\.cpp" . "template.cpp")
      (cons '("\\.py"  . "template.py")
	      auto-insert-alist)))
(add-hook 'find-file-hooks 'auto-insert)

;3つ以上のウィンドウを開いている時，C-x oでポップアップ表示しながらウィンドウを移動できるようにする(site-lispにpopup.elとpopup-select-window.elが必要)
;; (require 'popup)
;; (require 'popup-select-window)
;; (global-set-key "\C-xo" 'popup-select-window)
;; (setq popup-select-window-window-highlight-face '(:foreground "white" :background "orange"))


;C-x C-f /sudo:root@remote.alias:/path/to/fileで，この設定ファイルの内容を保持したまま，sshのリモートホストのファイルをsudo権限で編集することができる
;; (require 'tramp)
;; (add-to-list 'tramp-default-proxies-alist '("remote.alias" nil "/ssh:user@remote:"))

;;flymake
;; (require 'flymake)

;; ;C++
;; (defun flymake-cc-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

;; (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
;; (add-hook 'c++-mode-hook
;;           '(lambda ()
;;              (flymake-mode t)))

;; ;; Python-flake
;; (require 'flymake-python-pyflakes)
;; (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;javascript-mode(site-lispにjavascript.elが必要)
;; (autoload 'javascript-mode "javascript" nil t)
;; (setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist))

;espresso-mode(site-lispにespresso.elが必要)
;; (autoload #'espresso-mode "espresso" "Start espresso-mode" t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

; Interactively Do Things (highly recommended, but not strictly required)
;; (require 'ido)
;; (ido-mode t)

;; emmet-modeの設定(ELPAによるemmet-modeのインストールが必要)
;; (require 'emmet-mode)
;; (add-hook 'sgml-mode-hook 'emmet-mode)
;; (add-hook 'css-mode-hook  'emmet-mode)       ; 自動起動
;; (add-hook 'emmet-mode-hook 
;;     (lambda () (setq emmet-indentation 2)))  ; インデントの設定
;; (setq emmet-move-cursor-between-quotes t)    ; カーソルの自動移動

;; yaml-mode(ELPAによるyaml-modeのインストールが必要)
;; (when (require 'yaml-mode nil t)
;;   (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

; Rinari(rinariの導入が必要)
;(add-to-list 'load-path "~/.emacs.d/site-lisp/rinari")
;(require 'rinari)
;(add-to-list 'auto-mode-alist '("\\.erb$" . rinari-mode))


;文字数のカウント(site-lispにword-count.elが必要)
;M-+でword-count-modeに移行、戻る
;M-spaceでカウントの起点を動かす(その他詳しくはword-count.elに説明あり)
;; (setq load-path (cons (expand-file-name "~/elisp") load-path))
;; (autoload 'word-count-mode "word-count"
;;   "Minor mode to count words." t nil)
;; (global-set-key "\M-+" 'word-count-mode)

(provide '99_garbage)
;;; 99_garbage.el ends here
