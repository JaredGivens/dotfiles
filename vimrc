" install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize vim-plug
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

call plug#end()

let mapleader = " "

" FZF key bindings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
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
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if executable('rg')
        set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

" Basic settings
syntax enable
set notermguicolors
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set listchars=tab:>-,trail:-,space:.

hi NonText                       ctermfg=0
hi ColorColumn                   cterm=None ctermbg=0
hi String                        ctermfg=10
hi Identifier                    ctermfg=14
hi Function                      ctermfg=15
hi Type                          ctermfg=4
hi PreProc                       ctermfg=13
hi LspErrorHighlight             cterm=underline ctermul=1
hi LspWarningHighlight           cterm=underline ctermfg=3
hi LspInformationHighlight       ctermfg=6
hi LspErrorText                  ctermbg=None ctermfg=1
hi LspWarningText                ctermbg=None ctermfg=3
hi GitGutterAdd                  cterm=bold ctermfg=2 ctermbg=None guibg=Grey
hi GitGutterChange               cterm=bold ctermfg=3 ctermbg=None guibg=Grey
hi GitGutterDelete               cterm=bold ctermfg=1 ctermbg=None  guifg=Blue guibg=Grey
hi SignColumn                    ctermbg=None
hi Constant                      ctermfg=13
hi PreProc                       ctermfg=13
hi LineNr                        ctermfg=6
hi Statement                     ctermfg=11
hi Comment                       ctermfg=6
hi Special                       ctermfg=None
hi SpecialKey                    ctermfg=0
hi Search                        ctermbg=3
hi Visual                        ctermbg=8 ctermfg=None
hi FoldedColumn                  ctermfg=12 ctermbg=8
hi Folded                        ctermfg=12 ctermbg=8
hi DiffAdd                       cterm=bold ctermfg=2 ctermbg=None
hi DiffChange                    cterm=bold ctermfg=3 ctermbg=None
hi DiffDelete                    cterm=bold ctermfg=1 ctermbg=None
hi Pmenu None
