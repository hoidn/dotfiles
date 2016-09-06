"disables YCM
"let g:loaded_youcompleteme = 1
set path=$PWD/**
call pathogen#infect()


syntax on
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4
au BufRead,BufNewFile *.cc setfiletype cpp
autocmd Filetype h setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype hpp setlocal expandtab tabstop=4 shiftwidth=4
"

let mapleader=" "

" map , to toggle fold
nnoremap , za

map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

nnoremap <C-w> :w<CR>

" multiline edit shortcut
" noremap <leader>n :norm 

" Toggle showing invisible characters
map <leader>s :set list!<CR>

let g:syntastic_always_populate_loc_list = 1
" Configure syntastic for python
let g:syntastic_mode_map = {
    \ "mode": "passive",
        \ "active_filetypes": ["python"] }
let g:syntastic_python_checkers = ['pyflakes']

noremap <leader>] :lnext<CR>
noremap <leader>[ :lprevious<CR>
	
" This gets jedi to show call signatures when YCM is enabled
call jedi#configure_call_signatures()
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 0

let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#completions_enabled = 0

" jedi key mappings
autocmd Filetype python vnoremap <leader>d "_d
autocmd Filetype python vnoremap <leader>p "_dP

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
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <leader>f :Locate 
nnoremap <leader>w :Windows<CR>
" vim command history
nnoremap <leader>H :History:<CR>
" recently opened files
nnoremap <leader>c :History<CR>
"nnoremap <silent> <leader>; :BLines<CR>
"nnoremap <silent> <leader>o :BTags<CR>
"nnoremap <silent> <leader>O :Tags<CR>
"nnoremap <silent> <leader>? :History<CR>
"nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap  <leader>a :Ag<CR>
vnoremap  K :call SearchVisualSelectionWithAg()<CR>

function! SearchVisualSelectionWithAg() range
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

" Enter ranger file manager
map <Leader>x :call RangerExplorer()<CR>
