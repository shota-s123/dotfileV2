#!/bin/bash

# このスクリプトはchezmoiによって初回のみ実行されます
# oh-my-zshとプラグインをインストールします

set -e  # エラーが発生した場合にスクリプトを終了

echo "=== oh-my-zshとプラグインのインストールを開始します ==="

# oh-my-zshがインストールされているか確認
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zshをインストールしています..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "oh-my-zshのインストールが完了しました"
else
  echo "oh-my-zshはすでにインストールされています"
fi

# oh-my-zshのカスタムプラグインディレクトリを作成
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
mkdir -p "$ZSH_CUSTOM/plugins"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "zsh-autosuggestionsをインストールしています..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  echo "zsh-autosuggestionsのインストールが完了しました"
else
  echo "zsh-autosuggestionsはすでにインストールされています"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "zsh-syntax-highlightingをインストールしています..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  echo "zsh-syntax-highlightingのインストールが完了しました"
else
  echo "zsh-syntax-highlightingはすでにインストールされています"
fi

# zsh-completions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
  echo "zsh-completionsをインストールしています..."
  git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"
  echo "zsh-completionsのインストールが完了しました"
else
  echo "zsh-completionsはすでにインストールされています"
fi

echo "=== oh-my-zshとプラグインのインストールが完了しました ==="