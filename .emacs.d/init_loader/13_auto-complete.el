;;; 13_auto-complete.el --- 

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

;; auto-complete.elの設定

;;; Code:
(require 'auto-complete)
(global-auto-complete-mode t)

(define-key ac-completing-map (kbd "C-n") 'ac-next)      ; C-nで次候補選択
(define-key ac-completing-map (kbd "C-p") 'ac-previous)  ; C-pで前候補選択
(setq ac-dwim t)  ; 空気読んでほしい

;; 情報源として
;; * ac-source-filename
;; * ac-source-words-in-same-mode-buffers
;; を利用
(setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers))
;; また、Emacs Lispモードではac-source-symbolsを追加で利用
;; (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols t)))
;; 以下、自動で補完する人用
(setq ac-auto-start 3)

(require 'auto-complete-config)    
(add-to-list 'ac-dictionary-directories "~/.emacs.d/.cask/24.3.1/elpa/auto-complete-20140824.1658/dict")
(ac-config-default)

(provide '13_auto-complete)
;;; 13_auto-complete.el ends here
