"disables YCM
"let g:loaded_youcompleteme = 1
set path=$PWD/**
call pathogen#infect()

syntax on
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4


let mapleader=","
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Toggle showing invisible characters
map <leader>s :set list!<CR>
	
" Configure jedi-vim
let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#completions_enabled = 1
" This gets jedi to show call signatures when YCM is enabled
let g:jedi#show_call_signatures_delay = 0



" Make the undo history persistent
" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo

" Extra key bindings for fzf
"
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }
