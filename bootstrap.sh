#!/bin/bash
# bootstrap.sh - 新しい Mac のセットアップ
# Usage: curl -fsSL https://raw.githubusercontent.com/shota-s123/dotfileV2/main/bootstrap.sh | bash

set -e

echo "🚀 Starting Mac setup..."

# Homebrew インストール
if ! command -v brew &> /dev/null; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Apple Silicon の場合のパス設定
  if [[ $(uname -m) == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "✅ Homebrew already installed"
fi

# chezmoi インストール & dotfiles 展開
if ! command -v chezmoi &> /dev/null; then
  echo "📦 Installing chezmoi..."
  brew install chezmoi
else
  echo "✅ chezmoi already installed"
fi

echo "🔧 Initializing dotfiles..."
chezmoi init --apply shota-s123/dotfileV2

# Brewfile から残りのパッケージをインストール
echo "📦 Installing packages from Brewfile..."
brew bundle --file="$HOME/.Brewfile"

echo ""
echo "✨ Setup complete!"
echo "Please restart your terminal to apply all changes."
