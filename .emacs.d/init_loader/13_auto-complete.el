;;; 13_auto-complete.el --- auto-complete configuration

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, auto-completion

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

;;

;;; Code:

(require 'auto-complete)
(require 'auto-complete-config)

(global-auto-complete-mode t)

;; If the candidate is only one, it won't display the completion window
(setq ac-dwim t)

;; Start auto-completion after you type the number of characters
(setq ac-auto-start 3)

;; Enable C-n/C-p in the completion window
(setq ac-use-menu-map t)

;; Use fuzzy.el to allow fuzzy completion
(setq ac-use-fuzzy t)

;; Use default dictionary for completion
(ac-config-default)

(provide '13_auto-complete)
;;; 13_auto-complete.el ends here
