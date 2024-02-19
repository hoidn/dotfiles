vim.cmd [[
set path=$PWD/**

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/seoul256.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'dpayne/CodeGPT.nvim'
Plug '/home/ollie/Documents/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'ggandor/leap.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'

Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/cmp-vsnip' -- For snippet support
"Plug 'hrsh7th/vim-vsnip' -- Snippet engine
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

autocmd! VimEnter * lua require('leap').set_default_keymaps()

call plug#end()

let mapleader=" "

" map , to toggle fold
nnoremap , za

imap jk <Esc>
" Match default binding in Spacemacs
imap fd <Esc>
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>


" Map ctrl-s to save in normal and insert mode
nmap <C-s> :w<CR>
imap <c-s> <Esc>:w<CR>
map <leader>q :q<CR>
map <leader>w :w<CR>

" multiline edit shortcut
 noremap <leader>n :norm 
 noremap <leader>i :norm i#<CR>
 autocmd Filetype python vmap <leader>c :norm i#<CR>

" toggle line number
 noremap <leader>N :set nu!<CR>

" Toggle showing invisible characters
"map <leader>s :set list!<CR>
map <leader>e :split<CR>
map <leader>v :vsplit<CR>

" Call norm ex command in visual mode
vmap <leader>n :norm 

" un-highlight search results
nmap <leader>/ :nohlsearch<CR>

noremap ]<leader> :lnext<CR>
noremap [<leader> :lprevious<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

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
"vnoremap  K :call SearchVisualSelectionWithAg()<CR>

function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
" Enter ranger file manager
nmap <Leader>x :call RangerExplorer()<CR>

"TODO: debug missing fzf#vim#grep
"let g:NERDTreeHijackNetrw = 0 // add this line if you use NERDTree
" // open ranger when vim open a directory
"let g:ranger_replace_netrw = 1

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

set clipboard=unnamed


" Disable jedi completions in favor of YCM (we still want jedi semantic completions though)
let g:jedi#completions_enabled = 1
let g:jedi#use_splits_not_buffers = "bottom"
let g:pymode_rope = 0

" Jedi
"autocmd FileType python setlocal completeopt-=preview
" fix for neocomplete
"let g:jedi#popup_select_first = 0
"let g:jedi#popup_on_dot = 0

" neocomplete
" use TAB completion neocomplete
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:neocomplete#enable_at_startup = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

" jedi key mappings
autocmd Filetype python vnoremap <leader>d "_d
"autocmd Filetype python vnoremap <leader>p "_dP
autocmd Filetype rc vmap <leader>c :norm i"<CR>
vmap <leader>x :norm x<CR>

syntax on
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4
au BufRead,BufNewFile *.cc setfiletype cpp
autocmd Filetype h setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype hpp setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype tex setlocal expandtab tabstop=2 shiftwidth=2
"


let g:syntastic_always_populate_loc_list = 1
" Configure syntastic for python
let g:syntastic_mode_map = {
    \ "mode": "passive",
        \ "active_filetypes": ["python"] }
let g:syntastic_python_checkers = ['pyflakes']

	
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" YCM clang key mappings
"let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_extra_conf_vim_data = ['&filetype']
autocmd Filetype cpp noremap <leader>d :YcmCompleter GoTo<CR>
autocmd Filetype c noremap <leader>d :YcmCompleter GoTo<CR>
autocmd Filetype python noremap <leader>f :YcmCompleter GoTo<CR>


"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Have YCM populate the location list with errors
"let g:ycm_always_populate_location_list = 1

" Autoclose preview window
let g:ycm_autoclose_preview_window_after_insertion = 0


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

" bind ctrl-d to fzf tag search in c files
" see https://github.com/junegunn/fzf.vim/issues/323
" nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>
nnoremap <leader>L :call fzf#run({'source': 'git ls-files', 'sink': 'e'})<CR>

" TODO: debug the following:
"let g:rg_command = '
"  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
"  \ -g "!{.git,node_modules,vendor}/*" '
"
"command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
" git grep
"command! -bang -nargs=* GGrep
"  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)<Paste>

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>u :Buffers<CR>
nnoremap <leader>f :Locate 
" nnoremap <leader>w :Windows<CR>
" vim command history
nnoremap <leader>H :History:<CR>
" recently opened files
nnoremap <leader>c :History<CR>
" "nnoremap <silent> <leader>; :BLines<CR>
" "nnoremap <silent> <leader>o :BTags<CR>
" "nnoremap <silent> <leader>O :Tags<CR>
" "nnoremap <silent> <leader>? :History<CR>
" "nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap  <leader>a :Ag<CR>

let g:slime_target = "tmux"
" use the %cpaste function in Python buffers
let g:slime_python_ipython = 1

set backspace=indent,eol,start " make backspace work over linebreaks, etc.

" Unified color scheme (default: dark)
colo seoul256

" Light color scheme
"colo seoul256-light

" Switch
set background=dark

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"vnoremap <leader>p "_dP
nnoremap <leader>p :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
]]

vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', {noremap = true})

require'lspconfig'.pyright.setup{}

local cmp = require'cmp'

-- https://chat.openai.com/share/f317e520-9de4-4d11-9cd8-469162f139fc
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For snippets
  }, {
    { name = 'buffer' },
  })
})

-- Setup lspconfig.
require('lspconfig')['pyright'].setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

function search_custom_dir()
  local input_dir = vim.fn.input("Enter directory: ", "", "file")
  require'telescope.builtin'.find_files({ cwd = input_dir })
end

vim.api.nvim_set_keymap('n', '<Leader>fd', '<cmd>lua search_custom_dir()<CR>', { noremap = true, silent = true })
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
