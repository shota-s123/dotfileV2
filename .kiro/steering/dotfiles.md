# Chezmoi Dotfiles リポジトリ

このリポジトリは chezmoi を使用して管理されている dotfiles です。

## リポジトリ構造

```
.
├── .chezmoi.toml.tmpl      # chezmoi 設定テンプレート
├── .chezmoiignore          # chezmoi 無視ファイル
├── dot_gitconfig           # Git 設定
├── dot_gitignore           # グローバル gitignore
├── dot_zshrc               # Zsh 設定
├── run_once_install-oh-my-zsh.sh  # oh-my-zsh インストールスクリプト
├── private_dot_config/
│   └── nvim/               # Neovim 設定
│       ├── init.lua
│       ├── lazy-lock.json
│       └── lua/
│           ├── core/       # 基本設定
│           └── plugins/    # プラグイン設定
└── private_Library/        # macOS アプリケーション設定
    └── private_Application Support/
        └── private_Cursor/
            └── User/
                └── settings.json
```

## Chezmoi 命名規則

- `dot_` → `.` に変換（例: `dot_zshrc` → `.zshrc`）
- `private_` → パーミッション 0600 で作成
- `run_once_` → 初回のみ実行されるスクリプト
- `.tmpl` → テンプレートファイル（Go テンプレート構文）

## 主要コンポーネント

### シェル環境
- Zsh + Oh My Zsh
- プラグイン: zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions
- Starship プロンプト
- fzf, zoxide 統合

### 開発ツール
- pyenv (Python バージョン管理)
- nodenv (Node.js バージョン管理)
- nvm (Node.js バージョン管理 - 代替)
- Homebrew (macOS パッケージ管理)

### エディタ
- Neovim (lazy.nvim でプラグイン管理)
  - LSP サポート (Mason)
  - TreeSitter
  - Telescope
  - tokyonight カラースキーム

## 編集時の注意事項

1. ファイル名の prefix を正しく使用すること
2. テンプレートファイル (`.tmpl`) では Go テンプレート構文を使用
3. `run_once_` スクリプトは冪等性を考慮して作成
4. Neovim 設定は Lua で記述
5. macOS 向けの設定が含まれている（Homebrew パス等）

## よく使うコマンド

```bash
# 変更を適用
chezmoi apply

# 差分を確認
chezmoi diff

# ファイルを編集
chezmoi edit <file>

# ソースディレクトリに移動
chezmoi cd

# 新しいファイルを追加
chezmoi add <file>
```
