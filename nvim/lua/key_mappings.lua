-- Set leader key to a space
vim.g.mapleader = " "

-- Map ',' to toggle fold
vim.api.nvim_set_keymap('n', ',', 'za', {noremap = true})

-- Map 'jk' to escape in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})

-- Map 'fd' to escape in insert mode (Match default binding in Spacemacs)
vim.api.nvim_set_keymap('i', 'fd', '<Esc>', {noremap = true})

-- Window navigation mappings using the leader key
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', {noremap = true})

-- Map ctrl-s to save in normal and insert mode
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', {noremap = true})

-- Map leader key with 'q' to quit and 'w' to save
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', {noremap = true})

-- Toggle line number with leader key and 'N'
vim.api.nvim_set_keymap('n', '<leader>N', ':set nu!<CR>', {noremap = true})

-- Split window mappings using the leader key
vim.api.nvim_set_keymap('n', '<leader>e', ':split<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', {noremap = true})

-- Un-highlight search results with leader key and '/'
vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<CR>', {noremap = true})

-- Navigation through location list with leader key and brackets
vim.api.nvim_set_keymap('n', ']<leader>', ':lnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '[<leader>', ':lprevious<CR>', {noremap = true})

-- Map leader key with 'L' to list files using fzf
vim.api.nvim_set_keymap('n', '<leader>L', ':call fzf#run({\'source\': \'git ls-files\', \'sink\': \'e\'})<CR>', {noremap = true, silent = true})

-- Map leader key with 'F' to search files using fzf
vim.api.nvim_set_keymap('n', '<leader>F', ':Files<CR>', {noremap = true, silent = true})

-- Map leader key with 'u' to list buffers using fzf
vim.api.nvim_set_keymap('n', '<leader>u', ':Buffers<CR>', {noremap = true, silent = true})

-- Map leader key with 'f' to locate files
vim.api.nvim_set_keymap('n', '<leader>f', ':Locate ', {noremap = true})

-- Map leader key with 'H' to show command history
vim.api.nvim_set_keymap('n', '<leader>H', ':History:<CR>', {noremap = true})

-- Map leader key with 'c' to show recently opened files
vim.api.nvim_set_keymap('n', '<leader>c', ':History<CR>', {noremap = true, silent = true})

-- Map leader key with 'a' to search text using Ag
vim.api.nvim_set_keymap('n', '<leader>a', ':Ag<CR>', {noremap = true, silent = true})
