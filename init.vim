call plug#begin(stdpath('data') . '/plugged')

Plug 'ziglang/zig.vim'
Plug 'flazz/vim-colorschemes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme zenburn

set splitbelow
set splitright
set ignorecase

"" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set smartindent

"" UI
set relativenumber
set number

let mapleader = ","

" movement
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

" split properly
nnoremap <leader>V <C-W>v
nnoremap <leader>S <C-W>s

" edit and reload main config
nnoremap <leader>ev :exe 'edit '.stdpath('config').'/init.vim'<CR>
nnoremap <leader>sv :exe 'source '.stdpath('config').'/init.vim'<CR>

" fzf search git files (basically search in repo)
nnoremap <leader>f :GFiles<CR>
" fzf search all files in pwd
nnoremap <leader>F :Files<CR>
" fzf search buffers
nnoremap <leader>b :Buffers<CR>
" fzf search in file
nnoremap <leader>sf :BLines<CR>
nnoremap <silent> <leader>/ :nohl<CR>
