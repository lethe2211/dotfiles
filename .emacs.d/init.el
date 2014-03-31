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

;; yes or noでなく，y or nで答えられるようにする
(defalias 'yes-or-no-p 'y-or-n-p)

;バックアップファイルは作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;カーソルがどの関数の中にあるかをモードラインに表示する
(which-function-mode 1)

;; C-tでウィンドウの切り替え
(global-set-key "\C-t" 'other-window)

;3つ以上のウィンドウを開いている時，C-x oでポップアップ表示しながらウィンドウを移動できるようにする(site-lispにpopup.elとpopup-select-window.elが必要)
(require 'popup)
(require 'popup-select-window)
(global-set-key "\C-xo" 'popup-select-window)
(setq popup-select-window-window-highlight-face '(:foreground "white" :background "orange"))

;; ELPAの設定
;; M-x package-installで好きなパッケージをインストールできる
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
	       '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize))

;C-x C-f /sudo:root@remote.alias:/path/to/fileで，この設定ファイルの内容を保持したまま，sshのリモートホストのファイルをsudo権限で編集することができる
(require 'tramp)
(add-to-list 'tramp-default-proxies-alist '("remote.alias" nil "/ssh:user@remote:"))

;; auto-completeの設定(elpaでauto-completeをインストールする必要がある)
(require 'auto-complete-config)
(ac-config-default)

;; Pythonの自動補完(site-lispにac-python.elが必要)
(require 'ac-python) 
(add-to-list 'ac-modes 'python-2-mode)

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

;; Python-flake
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

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
      (cons '("\\.cpp" . "template.cpp")
      (cons '("\\.py"  . "template.py")
	      auto-insert-alist)))
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

;; web-modeの設定(ELPAによるweb-modeのインストールが必要)
(when (require 'web-mode nil t)
  ;; 自動的にWeb-modeを起動したい拡張子を追加する
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  ;; Web-modeのインデント設定用フック
  (defun Web-mode-hook ( )
    "Hooks for Web mode."
    (setq Web-mode-markup-indent-offset 2) ; HTMLのインデント
    (setq Web-mode-css-indent-offset 2)	   ; CSSのインデント
    (setq Web-mode-code-indent-offset 2) ; JS, PHP, Rubyなどのインデント
    (setq Web-mode-comment-style 2)	 ; Web-mode内のコメントのインデント
    (setq Web-mode-style-padding 1)	   ; <style>内のインデント開始レベル
    (setq Web-mode-script-padding 1)	   ; <script>内のインデント開始レベル
    )
  (add-hook 'Web-mode-hook 'Web-mode-hook)
)

;; yaml-mode(ELPAによるyaml-modeのインストールが必要)
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

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
