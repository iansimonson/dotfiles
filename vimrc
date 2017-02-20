set nocompatible

"----------------------------------------------------------------
"PLUGINS
"---------------------------------------------------------------

call plug#begin('$HOME/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'justinmk/vim-syntax-extra'

call plug#end()

"----------------------------------------------------------------
"PLUGIN OPTIONS
"---------------------------------------------------------------
 let g:ackprg='ag --nogroup --nocolor --column'

" Airline
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = '|'

" Ctrl-P
 let g:ctrlp_map = '<c-p>'
 let g:ctrlp_cmd = 'CtrlP'

 " cpp enhanced highlighting
 let g:cpp_class_scope_highlight = 1
 "let g:cpp_experimental_template_highlight = 1

"----------------------------------------------------------------
"Settings
"---------------------------------------------------------------
set backspace=indent,eol
set statusline= "%{fugitive#statusline()}"
set ignorecase
set smartcase
set noswapfile
set nobackup
set laststatus=2
set mouse=c

"" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set smartindent

"" UI
set lazyredraw
set background=dark
colorscheme gruvbox
set showmatch
set hlsearch
set incsearch
set relativenumber
set number
set ruler
set splitbelow
set splitright

set title
set titlestring=NVIM:\ %-25.55F\ %a%r%m titlelen=70

"" Code Specific settings
set foldmethod=syntax
set foldlevel=99 "" unfolded to start

"" Necessary key rebindings
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
