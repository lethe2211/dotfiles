# dotfiles

Mac向け開発環境のセットアップ用dotfilesリポジトリです。

参考: [[Memo] Macを導入したらいつもやっていることリスト](https://qiita.com/lethe2211/items/fc81d61083694e20dc6b)

## 含まれる設定ファイル

| ファイル | 説明 |
|---|---|
| `.zshrc` | zshの設定（プロンプト、エイリアス、補完、キーバインドなど） |
| `.zshenv` | zshの環境変数設定 |
| `.zlogin` | zshログイン時の設定 |
| `.zprofile` | zshプロファイル設定 |
| `.gitconfig` | Gitの設定（エイリアス、エディタ、色設定など） |
| `.tmux.conf` | tmuxの設定（プレフィックスキー、マウス操作など） |
| `.claude/CLAUDE.md` | Claude Codeの設定 |

## セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/lethe2211/dotfiles.git ~/dotfiles

# シンボリックリンクを作成
cd ~/dotfiles
./setup.sh
```

`setup.sh` は以下のシンボリックリンクを作成します:

- `~/.zlogin` → `~/dotfiles/.zlogin`
- `~/.zshrc` → `~/dotfiles/.zshrc`
- `~/.zenv` → `~/dotfiles/.zenv`
- `~/.gitconfig` → `~/dotfiles/.gitconfig`
- `~/.tmux.conf` → `~/dotfiles/.tmux.conf`
- `~/.claude/CLAUDE.md` → `~/dotfiles/.claude/CLAUDE.md`

## 主なカスタマイズ内容

### zsh

- Emacsライクなキーバインド
- Gitブランチ表示付きプロンプト
- コマンド履歴の共有・重複排除（10,000件保持）
- 便利なエイリアス（Git操作、ファイル操作など）

### Git

- `git logg` でグラフ付きログ表示
- よく使うコマンドの短縮エイリアス（`br`, `co`, `ci`, `d` など）

### tmux

- プレフィックスキーを `C-j` に変更
- マウス操作を有効化
- `C-j r` で設定リロード
