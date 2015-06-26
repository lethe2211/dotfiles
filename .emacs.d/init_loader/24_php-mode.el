;;; 24_php-mode.el --- php-mode

;; Copyright (C) 2015  shogen

;; Author: shogen <shogen@shogen-virtual-machine>
;; Keywords: abbrev, abbrev, abbrev, 

;;; Commentary:

;; python-modeの設定

;;; Code:

;; php-mode-hook
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))

(provide '24_php-mode)
;;; 24_php-mode.el ends here
