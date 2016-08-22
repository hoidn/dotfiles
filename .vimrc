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
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype h setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype hpp setlocal expandtab tabstop=4 shiftwidth=4
"

let mapleader=","

"map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Toggle showing invisible characters
map <leader>s :set list!<CR>
	
" This gets jedi to show call signatures when YCM is enabled
call jedi#configure_call_signatures()
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 0

let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#completions_enabled = 0

" Set global config file for c languages (based on Debian distro)
"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm2.py'

" Have YCM populate the location list with errors
let g:ycm_always_populate_location_list = 1


" Make the undo history persistent
" tell it to use an undo file
"set undofile
"" set a directory to store the undo history
"set undodir=~/.vimundo
"set formatprg=par

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

function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>
