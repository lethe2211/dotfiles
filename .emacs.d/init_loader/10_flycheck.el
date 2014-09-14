;;; 10_flycheck.el --- 

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

;; flycheckの設定

;;; Code:

;; global setting
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Python
;; (add-hook 'python-mode-hook 'flycheck-mode)

;; Ruby
;; (add-hook 'ruby-mode-hook 'flycheck-mode)

;; flycheck-color-mode-line
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; flycheck-pos-tip
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; flycheck-tip
;; (require 'flycheck-tip)
;; (define-key your-prog-map (kbd "C-c C-n") 'flycheck-tip-cycle)
;; (define-key your-prog-map (kbd "C-c C-p") 'flycheck-tip-cycle-reverse)

(provide '10_flycheck)
;;; 10_flycheck.el ends here
