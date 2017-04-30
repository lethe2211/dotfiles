;;; 27_elixir-mode.el ---

;; Copyright (C) 2017  Shogen

;; Author: Shogen <shuhei.shogen@P40738>

;; elixir-mode
(require 'elixir-mode)

;; alchemist
(require 'alchemist)

;; ac-alchemist (auto-complete for alchemist)
(add-hook 'elixir-mode-hook 'ac-alchemist-setup)

(provide '27_elxir-mode)
;;; 27_elixir-mode.el ends here

