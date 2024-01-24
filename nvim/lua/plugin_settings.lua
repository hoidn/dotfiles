-- Plugin settings for Neovim

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

-- Ranger
vim.api.nvim_exec([[
  function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
  endfun
  nmap <Leader>x :call RangerExplorer()<CR>
]], false)

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
