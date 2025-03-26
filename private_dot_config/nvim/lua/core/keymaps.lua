-- core/keymaps.lua
-- キーマッピング設定

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local move_opts = { noremap = false, silent = true } -- 移動キー用のオプション

-- キーリピート設定
vim.opt.timeoutlen = 300  -- キーマップのタイムアウト時間（ミリ秒）
vim.opt.ttimeoutlen = 10  -- キーコードのタイムアウト時間（ミリ秒）

-- リーダーキーの設定
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 入力モード中に素早くjjと入力した場合はESCとみなす
keymap('i', 'jj', '<Esc>', opts)

-- ESCを二回押すことでハイライトを消す
keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- 検索後にジャンプした際に検索単語を画面中央に持ってくる
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)
keymap('n', 'g*', 'g*zz', opts)
keymap('n', 'g#', 'g#zz', opts)

-- j, k による移動を折り返されたテキストでも自然に振る舞うように変更
keymap('n', 'j', 'gj', move_opts)
keymap('n', 'k', 'gk', move_opts)

-- h, l の移動も連続で行えるように設定
keymap('n', 'h', 'h', move_opts)
keymap('n', 'l', 'l', move_opts)

-- f, F, t, T による移動も連続で行えるように設定
keymap('n', 'f', 'f', move_opts)
keymap('n', 'F', 'F', move_opts)
keymap('n', 't', 't', move_opts)
keymap('n', 'T', 'T', move_opts)

-- Shift + h/l で行頭/行末に移動
keymap('n', '<S-h>', '^', opts)
keymap('n', '<S-l>', '$', opts)
keymap('v', '<S-h>', '^', opts)
keymap('v', '<S-l>', '$', opts)

-- Shift + 矢印キーで行頭/行末に移動
keymap('n', '<S-Right>', '$', opts)
keymap('n', '<S-Left>', '^', opts)
keymap('v', '<S-Right>', '$', opts)
keymap('v', '<S-Left>', '^', opts)
keymap('i', '<S-Right>', '<Esc>$a', opts)
keymap('i', '<S-Left>', '<Esc>^i', opts)

-- vを二回で行末まで選択
keymap('v', 'v', '$h', opts)

-- TABにて対応ペアにジャンプ
keymap('n', '<Tab>', '%', opts)
keymap('v', '<Tab>', '%', opts)

-- Ctrl + hjkl でウィンドウ間を移動
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- ノーマルモード時だけ ; と : を入れ替える
keymap('n', ';', ':', { noremap = true })
keymap('n', ':', ';', { noremap = true })

-- terminal mode を終了するコマンドのremap
keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- ウィンドウ操作
keymap('n', '<leader>w', '<C-w>', opts) -- ウィンドウコマンドのプレフィックス
keymap('n', '<leader>ws', ':split<CR>', opts) -- 水平分割
keymap('n', '<leader>wv', ':vsplit<CR>', opts) -- 垂直分割
keymap('n', '<leader>wq', ':close<CR>', opts) -- ウィンドウを閉じる

-- バッファ操作
keymap('n', '<leader>bn', ':bnext<CR>', opts) -- 次のバッファへ
keymap('n', '<leader>bp', ':bprevious<CR>', opts) -- 前のバッファへ
keymap('n', '<leader>bd', ':bdelete<CR>', opts) -- バッファを閉じる
keymap('n', '<leader>bl', ':buffers<CR>', opts) -- バッファリストを表示

-- ファイル操作
keymap('n', '<leader>fs', ':write<CR>', opts) -- ファイル保存
keymap('n', '<leader>fq', ':quit<CR>', opts) -- 終了
keymap('n', '<leader>fQ', ':qa!<CR>', opts) -- 強制終了

-- タブ操作
keymap('n', '<leader>tn', ':tabnew<CR>', opts) -- 新しいタブ
keymap('n', '<leader>tc', ':tabclose<CR>', opts) -- タブを閉じる
keymap('n', '<leader>to', ':tabonly<CR>', opts) -- 他のタブを閉じる
keymap('n', '<leader>tl', ':tabs<CR>', opts) -- タブリストを表示
keymap('n', '<C-Right>', ':tabnext<CR>', opts) -- 次のタブへ
keymap('n', '<C-Left>', ':tabprevious<CR>', opts) -- 前のタブへ

-- 行の移動
keymap('n', '<A-j>', ':m .+1<CR>==', opts) -- 行を下に移動
keymap('n', '<A-k>', ':m .-2<CR>==', opts) -- 行を上に移動
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts) -- 選択行を下に移動
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts) -- 選択行を上に移動

-- インデント調整
keymap('v', '<', '<gv', opts) -- インデントを減らす
keymap('v', '>', '>gv', opts) -- インデントを増やす

-- 検索
keymap('n', '<leader>/', '/', { noremap = true }) -- 検索
keymap('n', '<leader>*', '*', { noremap = true }) -- カーソル位置の単語を検索

-- 置換
keymap('n', '<leader>r', ':%s///g<Left><Left><Left>', { noremap = true }) -- 置換コマンド

-- ターミナル
keymap('n', '<leader>tt', ':terminal<CR>', opts) -- ターミナルを開く
keymap('n', '<leader>tv', ':vsplit | terminal<CR>', opts) -- 垂直分割してターミナルを開く
keymap('n', '<leader>ts', ':split | terminal<CR>', opts) -- 水平分割してターミナルを開く