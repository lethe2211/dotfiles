;言語環境
(set-language-environment "Japanese")
(setq default-input-method "MW32-IME")

;文字コード
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)

;ロードパスの追加
(add-to-list 'load-path "~/.emacs.d/site-lisp")

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

;バックアップファイルは作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;カーソルがどの関数の中にあるかをモードラインに表示する
(which-function-mode 1)

;3つ以上のウィンドウを開いている時，C-x oでポップアップ表示しながらウィンドウを移動できるようにする(site-lispにpopup.elとpopup-select-window.elが必要)
(require 'popup)
(require 'popup-select-window)
(global-set-key "\C-xo" 'popup-select-window)
(setq popup-select-window-window-highlight-face '(:foreground "white" :background "orange"))

;C-x C-f /sudo:root@remote.alias:/path/to/fileで，この設定ファイルの内容を保持したまま，sshのリモートホストのファイルをsudo権限で編集することができる
(require 'tramp)
(add-to-list 'tramp-default-proxies-alist '("remote.alias" nil "/ssh:user@remote:"))

;;flymake
(require 'flymake)

;C++
(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
(add-hook 'c++-mode-hook
          '(lambda ()
             (flymake-mode t)))

;Python
(defun flymake-python-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "pyflakes" (list local-file))))
 
(defconst flymake-allowed-python-file-name-masks '(("\.py$" flymake-python-init)))
(defvar flymake-python-err-line-patterns '(("\(.*\):\([0-9]+\):\(.*\)" 1 2 nil 3)))
 
(defun flymake-python-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-python-file-name-masks))
  (setq flymake-err-line-patterns flymake-python-err-line-patterns)
  (flymake-mode t))
(add-hook 'python-mode-hook '(lambda () (flymake-python-load)))

;C-hでカーソル前の1文字を消す(BackSpace)
(global-set-key "\C-h" 'delete-backward-char)

;M-gで入力した行にジャンプする
(global-set-key (kbd "M-g") 'goto-line)

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
