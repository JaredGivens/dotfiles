call plug#begin('~/.vim/plugged')

" FZF Integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP Support
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Git Features
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax highlighting (best option without treesitter)
Plug 'sheerun/vim-polyglot'

" Async make
Plug 'tpope/vim-dispatch'

" Status
 Plug 'itchyny/lightline.vim'
 Plug 'ayu-theme/ayu-vim' " or other package manager


call plug#end()

let mapleader = " "


" FZF key bindings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles?<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>rg :Rg<CR>

" LSP settings
function! s:on_lsp_buffer_enabled() abort
    let g:lsp_diagnostics_virtual_text_enabled = 0
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> gj <plug>(lsp-next-diagnostic)
    nmap <buffer> gk <plug>(lsp-previous-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

" git gutter settings
nmap <leader>hj <Plug>(GitGutterNextHunk)
nmap <leader>hk <Plug>(GitGutterPrevHunk)

augroup lsp_install
    au!
    au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if executable('rg')
        set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" Basic settings
syntax enable
set number
set relativenumber
set incsearch
set expandtab
set noswapfile
set nobackup
set nohlsearch
set nowrap
set scrolloff=4
set colorcolumn=80
set list
set tabstop=4
set shiftwidth=4
set softtabstop=4
set listchars=tab:>-,trail:-,space:.
set laststatus=2
set background=dark
