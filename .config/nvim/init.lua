vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'dpayne/CodeGPT.nvim'
Plug '/home/ollie/Documents/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'ggandor/leap.nvim'
autocmd! VimEnter * lua require('leap').set_default_keymaps()


call plug#end()
]]

-- Set the path to include the current working directory
vim.opt.path:append('**')

-- Set the clipboard to use the unnamed register
vim.opt.clipboard:prepend('unnamed')

-- Make the undo history persistent
vim.opt.undofile = true

-- Set a directory to store the undo history
vim.opt.undodir = vim.fn.expand('~/.vimundo')

-- Set backspace behavior
vim.opt.backspace = {'indent', 'eol', 'start'}

-- Set the format program
vim.opt.formatprg = 'par'

-- Disable polyglot vim syntax for Python
vim.g.polyglot_disabled = {'python'}

-- Unified color scheme (default: dark)
-- vim.cmd('colorscheme seoul256')

-- Switch background to dark
vim.opt.background = 'dark'
-- Custom functions and autocommands for Neovim

-- Function to search the visual selection with Ag
vim.api.nvim_exec([[
function SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction
vnoremap K :call SearchVisualSelectionWithAg()<CR>
]], false)

-- Function to open Ranger file manager
vim.api.nvim_exec([[
function RangerExplorer()
  exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
  if filereadable('/tmp/vim_ranger_current_file')
      exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
      call system('rm /tmp/vim_ranger_current_file')
  endif
  redraw!
endfunction
]], false)

-- Autocommands for setting file-specific options
vim.api.nvim_exec([[
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4
au BufRead,BufNewFile *.cc setfiletype cpp
autocmd Filetype h setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype hpp setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype tex setlocal expandtab tabstop=2 shiftwidth=2
]], false)

-- Additional custom key mappings
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', {noremap = true})

-- Additional settings
-- ...
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

-- Multiline edit shortcuts
vim.api.nvim_set_keymap('v', '<leader>n', ':norm ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>i', ':norm i#<CR>', { noremap = true, silent = true })

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
-- Plugin settings for Neovim

local has_xsel = vim.fn.executable("xsel") == 1

if has_xsel then
  vim.g.clipboard = {
    name = "xsel",
    copy = {
      ["+"] = "xsel --input --clipboard",
      ["*"] = "xsel --input --primary",
    },
    paste = {
      ["+"] = "xsel --output --clipboard",
      ["*"] = "xsel --output --primary",
    },
    cache_enabled = 0,
  }
end

-- Python host program
vim.g.python3_host_prog = '/home/ollie/anaconda3/envs/tf/bin/python3'

-- Pathogen
vim.cmd('call pathogen#infect()')

-- Syntastic
vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_mode_map = { mode = 'passive', active_filetypes = {'python'} }
vim.g.syntastic_python_checkers = {'pyflakes'}

-- YouCompleteMe (YCM)
-- vim.g.loaded_youcompleteme = 1 -- Uncomment this line to disable YCM
vim.g.ycm_server_keep_logfiles = 1
vim.g.ycm_server_log_level = 'debug'
vim.g.ycm_extra_conf_vim_data = {'&filetype'}
vim.g.ycm_autoclose_preview_window_after_insertion = 0
-- YCM key mappings
vim.api.nvim_exec([[
  autocmd Filetype cpp noremap <leader>d :YcmCompleter GoTo<CR>
  autocmd Filetype c noremap <leader>d :YcmCompleter GoTo<CR>
  autocmd Filetype python noremap <leader>f :YcmCompleter GoTo<CR>
]], false)

-- FZF
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}
-- FZF commands
vim.cmd([[
  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
]])

---- Ranger
--vim.api.nvim_exec([[
--  function RangerExplorer()
--    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
--    if filereadable('/tmp/vim_ranger_current_file')
--        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
--        call system('rm /tmp/vim_ranger_current_file')
--    endif
--    redraw!
--  endfun
--  nmap <Leader>x :call RangerExplorer()<CR>
--]], false)

-- Slime
vim.g.slime_target = 'tmux'
vim.g.slime_python_ipython = 1

-- Disable jedi completions in favor of YCM
vim.g.jedi_completions_enabled = 1
vim.g.jedi_use_splits_not_buffers = 'bottom'
vim.g.pymode_rope = 0
-- Jedi key mappings
vim.api.nvim_exec([[
  autocmd Filetype python vnoremap <leader>d "_d
]], false)

-- Disable polyglot vim syntax
vim.g.polyglot_disabled = {'python'}

-- Persistent undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.vimundo')

-- Format program
vim.opt.formatprg = 'par'

-- Color scheme
vim.cmd('colorscheme seoul256')
vim.opt.background = 'dark'

-- Additional key mappings for fzf-vim
-- ...

-- Additional settings
-- ...


-- Terminal mode escape mapping
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- Neoterm settings
vim.g.neoterm_position = 'vertical'
vim.api.nvim_set_keymap('n', '<C-c><C-c>', 'vip:TREPLSendSelection<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-c><C-x>', 'vip:TREPLSendLine<CR>', {noremap = true})

-- Neomake settings
vim.g.neomake_python_enabled_makers = {'pyflakes'}
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*',
    command = 'Neomake'
})

-- Magma setup
vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "ueberzug"

local function MagmaInitPython()
    vim.cmd(':MagmaInit python3')
    vim.cmd(':MagmaEvaluateArgument a=5')
end

local function MagmaInitCSharp()
    vim.cmd(':MagmaInit .net-csharp')
    vim.cmd(':MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");')
end

local function MagmaInitFSharp()
    vim.cmd(':MagmaInit .net-fsharp')
    vim.cmd(':MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")')
end

vim.cmd('command MagmaInitPython lua MagmaInitPython()')
vim.cmd('command MagmaInitCSharp lua MagmaInitCSharp()')
vim.cmd('command MagmaInitFSharp lua MagmaInitFSharp()')

-- Magma key mappings
vim.api.nvim_set_keymap('n', '<LocalLeader>r', ':MagmaEvaluateOperator<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>rr', ':MagmaEvaluateLine<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('x', '<LocalLeader>r', ':<C-u>MagmaEvaluateVisual<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>rc', ':MagmaReevaluateCell<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>rd', ':MagmaDelete<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>ro', ':MagmaShowOutput<CR>', {silent = true, noremap = true})
   -- Window navigation mappings
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>h', {noremap = true})
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n><C-w>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n><C-w>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', {noremap = true})


---- Function to set terminal background color
--local function set_terminal_background()
--    vim.api.nvim_set_hl(0, 'Normal', { bg = 'black' })
--end
--
---- Autocommand to change background color in terminal buffers
--vim.api.nvim_create_autocmd('TermOpen', {
--    pattern = 'term://*',
--    callback = set_terminal_background
--})
--
--
