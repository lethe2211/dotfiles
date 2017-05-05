;;; 12_helm.el --- helm (Interface to search anything in Emacs)

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, search, helm

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

;; helm
(require 'helm-mode)
(require 'helm-config)
(helm-mode 1)

;; helm-themes (helm interface for color themes)
(require 'helm-themes)

;; helm-mini
(bind-key* "C-c h" 'helm-mini)

;; helm-find-files (replacing default find-files)
(bind-key* "C-x C-f" 'helm-find-files)

;; helm-M-x (replacing default M-x)
(bind-key* "M-x" 'helm-M-x)

;; helm-git-grep
(require 'helm-git-grep)
(bind-key* "C-c g" 'helm-git-grep)
(bind-key "C-c g" 'helm-git-grep-from-isearch isearch-mode-map)
(eval-after-load 'helm
  '(bind-key "C-c g" 'helm-git-grep-from-helm helm-map))

(provide '12_helm)
;;; 12_helm.el ends here
