call plug#begin('~/.vim/plugged')

Plug 'kassio/neoterm'
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Plug '~/.fzf/bin/fzf' | Plug 'junegunn/fzf.vim'

call plug#end()

so ~/.vimrc_common

let g:neoterm_position='vertical'

let g:neomake_python_enabled_makers = ['pyflakes']

nmap <C-c><C-c> vip:TREPLSendSelection<CR>
nmap <C-c><C-x> vip:TREPLSendLine<CR>

" Make window navigation consistent
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


" lint on save:
autocmd BufWritePost,BufEnter * Neomake
