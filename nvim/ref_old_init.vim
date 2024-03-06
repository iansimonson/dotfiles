call plug#begin(stdpath('data') . '/plugged')

Plug 'ziglang/zig.vim'
Plug 'flazz/vim-colorschemes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'natebosch/vim-lsc'
Plug 'flrnd/candid.vim'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'alaviss/nim.nvim'
Plug 'Tetralux/odin.vim'
Plug 'vlime/vlime', {'rtp': 'vim/'}
Plug 'vim-scripts/paredit.vim'

call plug#end()

let g:lsc_server_commands = {'zig': ['zls'], 'rust': ['rust-analyzer']}
let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'GoToDefinitionSplit': 'gds',
    \}
autocmd CompleteDone * silent! pclose

let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 0

set termguicolors
set background=dark
syntax on
colorscheme candid


set splitbelow
set splitright
set ignorecase
set hidden

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

" java highlighting
let java_highlight_functions = 1

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

" git blame
nnoremap <leader>gg :Gblame<CR>

" close random peek windows
nnoremap <leader>cc :silent! pclose

" Nim only settings:
autocmd BufRead,BufNewFile *.nim set foldlevel=100
