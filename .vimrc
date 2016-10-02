"disables YCM
"let g:loaded_youcompleteme = 1
set path=$PWD/**
call pathogen#infect()

so ~/.vimrc_common

syntax on
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4
au BufRead,BufNewFile *.cc setfiletype cpp
autocmd Filetype h setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype hpp setlocal expandtab tabstop=4 shiftwidth=4
"


let g:syntastic_always_populate_loc_list = 1
" Configure syntastic for python
let g:syntastic_mode_map = {
    \ "mode": "passive",
        \ "active_filetypes": ["python"] }
let g:syntastic_python_checkers = ['pyflakes']

	

" YCM clang key mappings
"let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_extra_conf_vim_data = ['&filetype']
autocmd Filetype cpp noremap <leader>d :YcmCompleter GoTo<CR>
autocmd Filetype c noremap <leader>d :YcmCompleter GoTo<CR>


"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = '/home/oliver/dev/clusters/PlanetaryImager/.ycm_extra_conf.py'

" Have YCM populate the location list with errors
let g:ycm_always_populate_location_list = 1

" Autoclose preview window
let g:ycm_autoclose_preview_window_after_insertion = 1


" Make the undo history persistent
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo

set formatprg=par

" Disable polyglot vim syntax
let g:polyglot_disabled = ['python']

" Extra key bindings for fzf-vim
"


" TODO: think about using this:
"function! s:ag_in(...)
"  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
"endfunction
"
"command! -nargs=+ -complete=dir AgIn call s:ag_in(<f-args>)

"
"nnoremap <silent> K :call SearchWordWithAg()<CR>
"nnoremap <silent> <leader>gl :Commits<CR>
"nnoremap <silent> <leader>ga :BCommits<CR>
"nnoremap <silent> <leader>ft :Filetypes<CR>




let g:slime_target = "tmux"

set backspace=indent,eol,start " make backspace work over linebreaks, etc.

