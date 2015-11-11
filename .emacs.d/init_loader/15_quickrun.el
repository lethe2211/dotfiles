;;; 15_quickrun.el --- 

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

;; quickrun.el

;;; Code:

(defvar quickrun-file-alist
  '(("\\.c\\'" . "c")
    ("\\.\\(cpp\\|cxx\\|C\\|cc\\)\\'" . "c++")
    ("\\.m\\'" . "objc")
    ("\\.cs\\'" . "c#")
    ("\\.\\(pl\\|pm\\)\\'" . "perl")
    ("\\.rb\\'" . "ruby")
    ("\\.py\\'" . "python")
    ("\\.php\\'" . "php")
    ("\\.\\(el\\|elisp\\)\\'" . "emacs")
    ("\\.\\(lisp\\|lsp\\)\\'" . "lisp")
    ("\\.\\(scm\\|scheme\\)\\'" . "scheme")
    ("\\.js\\'" . "javascript")
    ("\\.clj\\'" . "clojure")
    ("\\.erl\\'" . "erlang")
    ("\\.ml\\'" . "ocaml")
    ("\\.\\(fsx?\\|fsscript\\)\\'" . "fsharp")
    ("\\.go\\'" . "go")
    ("\\.io\\'" . "io")
    ("\\.lua\\'" . "lua")
    ("\\.hs\\'" . "haskell")
    ("\\.java\\'" . "java")
    ("\\.d\\'" . "d")
    ("\\.\\(f\\|for\\|f90\\|f95\\)\\'" . "fortran")
    ("\\.\\(md\\|markdown\\|mdown\\|mkdn\\)\\'" . "markdown")
    ("\\.coffee\\'" . "coffee")
    ("\\.jsx\\'" . "jsx")
    ("\\.ts\\'" . "typescript")
    ("\\.scala\\'" . "scala")
    ("\\.groovy\\'". "groovy")
    ("\\.haml\\'" . "haml")
    ("\\.sass\\'" . "sass")
    ("\\.less\\'" . "less")
    ("\\.\\(sh\\|bash\\|zsh\\|csh\\|csh\\)\\'" . "shellscript")
    ("\\.awk\\'" . "awk")
    ("\\.rs\\'" . "rust")
    ("\\.dart\\'" . "dart/checked")
    ("\\.exs?\\'" . "elixir")
    ("\\.tcl\\'" . "tcl")
    ("\\.swift\\'" . "swift")
    ("\\.dats\\'" . "ats")
    ("\\.\\(r\\|R\\)\\'" . "r"))
  "Alist of (file-regexp . key)")

(defvar quickrun/major-mode-alist
  '((c-mode . "c")
    (c++-mode . "c++")
    (objc-mode . "objc")
    (csharp-mode . "c#")
    ((perl-mode cperl-mode) . "perl")
    (ruby-mode . "ruby")
    (python-mode . "python")
    (php-mode . "php")
    (emacs-lisp-mode . "emacs")
    (lisp-mode . "lisp")
    (scheme-mode . "scheme")
    ((javascript-mode js-mode js2-mode) . "javascript")
    (clojure-mode . "clojure")
    (erlang-mode . "erlang")
    ((ocaml-mode tuareg-mode) . "ocaml")
    (fsharp-mode . "fsharp")
    (go-mode . "go")
    (io-mode . "io")
    (lua-mode . "lua")
    (haskell-mode . "haskell")
    (java-mode . "java")
    (d-mode . "d")
    (fortran-mode . "fortran")
    (markdown-mode . "markdown")
    (coffee-mode . "coffee")
    (jsx-mode . "jsx")
    (typescript-mode . "typescript")
    (scala-mode . "scala")
    (groove-mode . "groovy")
    (haml-mode . "haml")
    (sass-mode . "sass")
    ((less-mode less-css-mode) . "less")
    (sh-mode . "shellscript")
    (awk-mode . "awk")
    (rust-mode . "rust")
    (dart-mode . "dart/checked")
    (elixir-mode . "elixir")
    (tcl-mode . "tcl")
    (swift-mode . "swift")
    (ats-mode . "ats")
    (ess-mode . "r"))
    "Alist of major-mode and langkey")

(define-key global-map (kbd "C-c C-c") 'quickrun)
(define-key global-map (kbd "C-c C-v") 'quickrun-with-arg)

(provide '15_quickrun.el)
;;; 15_quickrun.el ends here
