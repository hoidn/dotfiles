-- init.lua
-- Neovim configuration file written in Lua

-- Set Python3 provider
vim.g.python3_host_prog = '/home/ollie/anaconda3/envs/tf/bin/python3'

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>N', ':set nu!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<CR>', { noremap = true })

-- Python-specific settings
vim.cmd([[
  autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
  autocmd Filetype python vnoremap <leader>d "_d
]])

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.vimundo')

-- Syntax highlighting
vim.cmd('syntax on')

-- Clipboard settings
vim.opt.clipboard = 'unnamed'

-- Jedi settings
vim.g.jedi_completions_enabled = 1
vim.g.jedi_use_splits_not_buffers = 'bottom'
vim.g.pymode_rope = 0

-- Syntastic settings
vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_mode_map = { mode = 'passive', active_filetypes = { 'python' } }
vim.g.syntastic_python_checkers = { 'pyflakes' }

-- YCM settings
vim.g.ycm_server_keep_logfiles = 1
vim.g.ycm_server_log_level = 'debug'
vim.g.ycm_autoclose_preview_window_after_insertion = 0
vim.api.nvim_set_keymap('n', '<leader>f', ':YcmCompleter GoTo<CR>', { noremap = true })

-- Color scheme
vim.cmd('colo seoul256')
vim.opt.background = 'dark'
