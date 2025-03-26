-- core/options.lua
-- 基本的な設定オプション

local opt = vim.opt
local g = vim.g

-- Python パスの設定
g.python3_host_prog = vim.fn.expand('~/.pyenv/shims/python3')

-- エンコーディング設定
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = {'utf-8', 'iso-2022-jp', 'euc-jp', 'sjis'}

-- 表示関連の設定
opt.number = true                -- 行番号表示
opt.wrap = true                  -- テキストの折り返し
opt.showmatch = true             -- 対応する括弧をハイライト表示
opt.matchtime = 3                -- 対応括弧のハイライト表示時間
opt.list = true                  -- 不可視文字の可視化
opt.listchars = {                -- 不可視文字の表示形式
  tab = '»-',
  trail = '-',
  extends = '»',
  precedes = '«',
  nbsp = '%',
  eol = '↲'
}
opt.colorcolumn = '100'          -- 100文字目にラインを表示
opt.signcolumn = 'yes'           -- サインカラムを常に表示
opt.termguicolors = true         -- True Colorサポート
opt.laststatus = 3               -- グローバルステータスライン
opt.cmdheight = 1                -- コマンドラインの高さ
opt.scrolloff = 8                -- スクロール時の余白
opt.sidescrolloff = 8            -- 横スクロール時の余白
opt.textwidth = 0                -- 自動改行を無効化

-- 検索関連の設定
opt.ignorecase = true            -- 大文字小文字を区別しない
opt.smartcase = true             -- 検索文字に大文字がある場合は区別する
opt.incsearch = true             -- インクリメンタルサーチ
opt.hlsearch = true              -- 検索マッチテキストをハイライト

-- 編集関連の設定
opt.shiftround = true            -- インデントを'shiftwidth'の倍数に丸める
opt.infercase = true             -- 補完時に大文字小文字を区別しない
opt.virtualedit = 'all'          -- カーソルを文字が存在しない部分でも動かせる
opt.hidden = true                -- バッファを閉じる代わりに隠す
opt.switchbuf = 'useopen'        -- 既に開いているバッファを使用
opt.clipboard = 'unnamedplus'    -- システムクリップボードを使用
opt.autoindent = true            -- 自動インデント
opt.smartindent = true           -- スマートインデント
opt.expandtab = true             -- タブをスペースに変換
opt.tabstop = 4                  -- タブサイズ
opt.shiftwidth = 4               -- インデントサイズ
opt.softtabstop = 4              -- ソフトタブサイズ
opt.matchpairs:append('<:>')     -- 対応括弧に'<'と'>'のペアを追加
opt.backspace = {'indent', 'eol', 'start'} -- バックスペースの動作設定

-- ファイル関連の設定
opt.backup = false               -- バックアップファイルを作成しない
opt.writebackup = false          -- 書き込み時のバックアップを作成しない
opt.swapfile = false             -- スワップファイルを作成しない
opt.autowrite = true             -- 自動保存

-- その他の設定
opt.timeout = true               -- キーマッピングのタイムアウトを有効化
opt.timeoutlen = 300             -- キーマッピングのタイムアウト時間
opt.ttimeout = true              -- 端末のキーコードのタイムアウトを有効化
opt.ttimeoutlen = 50             -- 端末のキーコードのタイムアウト時間
opt.updatetime = 100             -- スワップファイルの書き込みとCursorHoldの時間
opt.completeopt = {'menuone', 'noselect'} -- 補完メニューの設定
opt.wildmenu = true              -- コマンドライン補完を強化
opt.wildmode = {'longest', 'full'} -- コマンドライン補完の動作設定
opt.mouse = 'a'                  -- マウスサポートを有効化

-- ファイルタイプごとのインデント設定
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'html', 'ruby'},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'javascript', 'typescript', 'javascriptreact', 'typescriptreact'},
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end
})

-- ディレクトリが存在しない場合に自動作成
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end
})

-- vim起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    vim.cmd('lcd %:p:h')
    vim.cmd('pwd')
  end
})