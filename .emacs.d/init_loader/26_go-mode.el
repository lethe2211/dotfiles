;;; 26_go_mode.el --- 

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

;; Go-mode

;;; Code:

;; Add environmental variables
;; (setenv "GOPATH" "~/go")
;; (setenv "PATH" (concat (getenv "PATH") ":" "/extra/path/element"))
;; (add-to-list 'exec-path (expand-file-name "~/go/bin"))

;; go-mode
(require 'go-mode)

;; go-fmt
(add-hook 'before-save-hook 'gofmt-before-save)

;; go-eldoc
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
		    :underline t :foreground "green"
		    :weight 'bold)

;; flycheck
(add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
(add-hook 'go-mode-hook 'flycheck-mode)

;; gocode
(add-to-list 'load-path "~/gocode/src/code.google.com/p/rog-go/exp/cmd/godef")
(add-to-list 'load-path "~/gocode/src/github.com/nsf/gocode")
(require 'go-autocomplete)
(require 'auto-complete-config)

(provide '26_go-mode)
;;; 26_go-mode.el ends here
