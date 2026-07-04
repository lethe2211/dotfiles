# dotfiles

Mac向け開発環境のセットアップ用dotfilesリポジトリです。

参考: [[Memo] Macを導入したらいつもやっていることリスト](https://qiita.com/lethe2211/items/fc81d61083694e20dc6b)

## 構成

| パス | 説明 |
|---|---|
| `zsh/.zshrc` | zshの設定（プロンプト、エイリアス、補完、キーバインドなど） |
| `zsh/.zshenv` | zshの環境変数設定 |
| `zsh/.zlogin` | zshログイン時の設定 |
| `zsh/.zprofile` | zshプロファイル設定 |
| `git/.gitconfig` | Gitの設定（エイリアス、エディタ、色設定など） |
| `tmux/.tmux.conf` | tmuxの設定（プレフィックスキー、マウス操作など） |
| `AGENTS.md` | コーディングエージェント（Codex / Claude Code）共通の指示ファイル |
| `claude-code/CLAUDE.md` | Claude Codeの指示ファイル（`AGENTS.md` を参照するのみ） |
| `claude-code/settings.json` | Claude Codeの設定（パーミッション、モデルなど） |
| `herdr/config.toml` | herdrの設定 |
| `setup.sh` | セットアップスクリプト |

## セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/lethe2211/dotfiles.git ~/dotfiles

# セットアップスクリプトを実行
cd ~/dotfiles
chmod +x ./setup.sh && ./setup.sh
```

`setup.sh` は以下を行います:

1. Homebrewのインストール（インストール済みの場合は `brew update && brew upgrade`）
2. CLIツールのインストール（zsh, git, tmux, herdr）
3. GUIアプリのインストール（Google Chrome, iTerm2, Ghostty, Alfred, Obsidian, Codex, Claude Code, Sublime Text, VS Code, IntelliJ IDEA, Zed, Slack, Microsoft Teams, Zoom, Rancher Desktop, Google日本語入力）
4. ログインシェルをzshに変更
5. 設定ファイルのシンボリックリンクを作成
   - `~/.zlogin`, `~/.zshrc`, `~/.zshenv`, `~/.zprofile` → `~/dotfiles/zsh/`
   - `~/.gitconfig` → `~/dotfiles/git/.gitconfig`
   - `~/.tmux.conf` → `~/dotfiles/tmux/.tmux.conf`
   - `~/.config/herdr/config.toml` → `~/dotfiles/herdr/config.toml`
   - `~/.codex/AGENTS.md` → `~/dotfiles/AGENTS.md`
   - `~/.claude/CLAUDE.md` → `~/dotfiles/claude-code/CLAUDE.md`
   - `~/.claude/AGENTS.md` → `~/dotfiles/AGENTS.md`
   - `~/.claude/settings.json` → `~/dotfiles/claude-code/settings.json`

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

### コーディングエージェント（Codex / Claude Code）

- `AGENTS.md` に共通の指示（日本語で応対、サブエージェント活用など）を記載し、CodexとClaude Codeの両方から参照
- `claude-code/settings.json` でClaude Codeのパーミッションと使用モデルを管理
