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
" Jedi
autocmd FileType python setlocal completeopt-=preview
" Enable call signatures.
call jedi#configure_call_signatures()
let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#show_call_signatures = 1
" This gets jedi to show call signatures when YCM is enabled
"let g:jedi#show_call_signatures_delay = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Configure neocomplete to work with jedi-vim
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" alternative pattern: '\h\w*\|[^. \t]\.\w*'



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

