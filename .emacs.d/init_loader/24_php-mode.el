;;; 24_php-mode.el --- php-mode

;; Copyright (C) 2017

;; Author: lethe2211
;; Keywords: emacs, configuration, major mode, php-mode

;;; Commentary:

;;

;;; Code:

(require 'php-mode)


;; php-mode-hook
(add-hook 'php-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (require 'ac-php)
             (setq ac-sources  '(ac-source-php ))
             (yas-global-mode 1)
             (ac-php-core-eldoc-setup) ; enable eldoc

             (bind-key "C-]" 'ac-php-find-symbol-at-point php-mode-map)	; goto define
             (bind-key "C-t" 'ac-php-location-stack-back php-mode-map) ; go back
             ))
(provide '24_php-mode)
;;; 24_php-mode.el ends here
