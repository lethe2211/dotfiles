;言語環境
(set-language-environment "Japanese")
(setq default-input-method "MW32-IME")

;文字コード
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)

;フォント
;(set-face-font 'default "Takaoゴシック 16")
;(set-default-font "Takaoゴシック")

;起動時の画面を表示しない
(setq inhibit-splash-screen t)

;メニューバーを表示しない
(menu-bar-mode 0)

;ツールバーを表示しない
(tool-bar-mode 0)

; 選択部分のハイライト
(transient-mark-mode t) 

;対応カッコのハイライト
(show-paren-mode t)

;Ctrl+Meta+vで1ページ上にスクロールする(デフォルトのM-vだと端末とキーバインドが競合する)
(global-set-key (kbd "C-M-v") 'scroll-down)

;Meta+nで2行下，Meta+pで2行上に移動
(global-set-key "\M-n" '(lambda ()
			   (interactive)
			   (next-line 2)))
(global-set-key "\M-p" '(lambda ()
			  (interactive)
			  (previous-line 2)))

;autoinsert
;テンプレートは~/emacs.d/templateに置く
(setq auto-insert-directory "~/.emacs.d/template/")
(load "autoinsert" t)
(setq auto-insert-alist
      (append '(("\\.py" . "utf8.py")
		)
	      auto-insert-alist))
(add-hook 'find-file-hooks 'auto-insert)

;javascript-mode(site-lispにjavascript.elが必要)
(autoload 'javascript-mode "javascript" nil t)
(setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist))

;espresso-mode(site-lispにespresso.elが必要)
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

; Rinari(rinariの導入が必要)
;(add-to-list 'load-path "~/.emacs.d/site-lisp/rinari")
;(require 'rinari)
;(add-to-list 'auto-mode-alist '("\\.erb$" . rinari-mode))

; rthml
;行番号表示(site-lispにlinum.elが必要)
(require 'linum)
(global-linum-mode)

;文字数のカウント(site-lispにword-count.elが必要)
;M-+でword-count-modeに移行、戻る
;M-spaceでカウントの起点を動かす(その他詳しくはword-count.elに説明あり)
(setq load-path (cons (expand-file-name "~/elisp") load-path))
(autoload 'word-count-mode "word-count"
  "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)
