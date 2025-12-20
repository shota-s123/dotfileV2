# dotfileV2

chezmoi で管理している macOS 用 dotfiles です。

## 🚀 新しい Mac へのセットアップ

```bash
curl -fsSL https://raw.githubusercontent.com/shota-s123/dotfileV2/main/bootstrap.sh | bash
```

これで Homebrew → chezmoi → dotfiles → Brewfile のパッケージまで一発でインストールされます。

## 📦 含まれるもの

- Zsh + Oh My Zsh（zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions）
- Starship プロンプト
- Neovim（lazy.nvim, LSP, TreeSitter, Telescope）
- fzf, zoxide
- pyenv, nodenv
- その他開発ツール（Brewfile 参照）

## 🔧 日常の操作

```bash
# 変更を適用
chezmoi apply

# 差分を確認
chezmoi diff

# ファイルを編集
chezmoi edit <file>

# 新しいファイルを追加
chezmoi add <file>
```
