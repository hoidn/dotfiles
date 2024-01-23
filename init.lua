-- This is a Lua translation of the .vimrc_common file

vim.g.python3_host_prog = '/home/ollie/anaconda3/envs/tf/bin/python3'

-- disables YCM
-- vim.g.loaded_youcompleteme = 1
vim.opt.path = vim.fn.getcwd() .. "/**"

vim.cmd('call pathogen#infect()')

-- Shared rc file for vim and neovim.

vim.g.mapleader = " "

-- map , to toggle fold
vim.api.nvim_set_keymap('n', ',', 'za', {})

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
-- Match default binding in Spacemacs
vim.api.nvim_set_keymap('i', 'fd', '<Esc>', {})
vim.api.nvim_set_keymap('', '<leader>h', ':wincmd h<CR>', {})
vim.api.nvim_set_keymap('', '<leader>j', ':wincmd j<CR>', {})
vim.api.nvim_set_keymap('', '<leader>k', ':wincmd k<CR>', {})
vim.api.nvim_set_keymap('', '<leader>l', ':wincmd l<CR>', {})

-- Map ctrl-s to save in normal and insert mode
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {})
vim.api.nvim_set_keymap('i', '<c-s>', '<Esc>:w<CR>', {})
vim.api.nvim_set_keymap('', '<leader>q', ':q<CR>', {})
vim.api.nvim_set_keymap('', '<leader>w', ':w<CR>', {})

-- multiline edit shortcut
vim.api.nvim_set_keymap('n', '<leader>n', ':norm ', {})
vim.api.nvim_set_keymap('n', '<leader>i', ':norm i#<CR>', {})
vim.cmd('autocmd Filetype python vmap <leader>c :norm i#<CR>')

-- toggle line number
vim.api.nvim_set_keymap('n', '<leader>N', ':set nu!<CR>', {})

-- Toggle showing invisible characters
-- vim.api.nvim_set_keymap('', '<leader>s', ':set list!<CR>', {})
vim.api.nvim_set_keymap('', '<leader>e', ':split<CR>', {})
vim.api.nvim_set_keymap('', '<leader>v', ':vsplit<CR>', {})

-- Call norm ex command in visual mode
vim.api.nvim_set_keymap('v', '<leader>n', ':norm ', {})

-- un-highlight search results
vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<CR>', {})

vim.api.nvim_set_keymap('', ']<leader>', ':lnext<CR>', {})
vim.api.nvim_set_keymap('', '[<leader>', ':lprevious<CR>', {})

vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit' }

-- Command for git grep
-- - fzf#vim#grep(command, with_column, [options], [fullscreen])
vim.cmd('command! -bang -nargs=* GGrep call fzf#vim#grep(\'git grep --line-number \'.shellescape(<q-args>), 0, <bang>0)')

-- TODO: translate the rest of the file
