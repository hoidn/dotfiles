call plug#begin()
" call plug#begin('~/.config/nvim/plugged')

" Add your plugins here like:
" Plug 'username/repository'
"Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'dpayne/CodeGPT.nvim'
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'

tnoremap jk <C-\><C-n>

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"

"function MagmaInitPython()
"    vim.cmd[[
"    :MagmaInit python3
"    :MagmaEvaluateArgument a=5
"    ]]
"end
"
"function MagmaInitCSharp()
"    vim.cmd[[
"    :MagmaInit .net-csharp
"    :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
"    ]]
"end
"
"function MagmaInitFSharp()
"    vim.cmd[[
"    :MagmaInit .net-fsharp
"    :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")
"    ]]
"end
"
"vim.cmd[[
":command MagmaInitPython lua MagmaInitPython()
":command MagmaInitCSharp lua MagmaInitCSharp()
":command MagmaInitFSharp lua MagmaInitFSharp()
"]]

"
"Plug 'kassio/neoterm'
"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'Valloric/YouCompleteMe'
"Plug 'davidhalter/jedi-vim'
"Plug 'airblade/vim-gitgutter'
"Plug 'ervandew/supertab'
"Plug 'sheerun/vim-polyglot'
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
"
""Plug '~/.fzf/bin/fzf' | Plug 'junegunn/fzf.vim'
"
"call plug#end()

so ~/.vimrc_common

let g:neoterm_position='vertical'

let g:neomake_python_enabled_makers = ['pyflakes']

nmap <C-c><C-c> vip:TREPLSendSelection<CR>
nmap <C-c><C-x> vip:TREPLSendLine<CR>

" escape terminal mode
:tnoremap <Esc> <C-\><C-n>

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
autocmd! BufWritePost * Neomake
call plug#end()
