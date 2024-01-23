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
