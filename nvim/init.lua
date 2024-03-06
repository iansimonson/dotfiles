vim.g.mapleader = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd([[
    autocmd CompleteDone * silent! pclose
    
    set splitbelow
    set splitright
    set ignorecase
    set hidden
    ]])

vim.cmd([[
    "" Indentation
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set smarttab
    set expandtab
    set autoindent
    set smartindent
    ]])


vim.cmd([[
    "" UI
    set relativenumber
    set number
    ]])

-- Split nicely
vim.keymap.set('n', '<leader>V', '<C-W>v', {noremap = true})
vim.keymap.set('n', '<leader>S', '<C-W>s', {noremap = true})

-- Movement between splits
vim.keymap.set('n', '<C-L>', '<C-W>l', {noremap = true})
vim.keymap.set('n', '<C-H>', '<C-W>h', {noremap = true})
vim.keymap.set('n', '<C-J>', '<C-W>j', {noremap = true})
vim.keymap.set('n', '<C-K>', '<C-W>k', {noremap = true})

-- Close random peek windows
vim.keymap.set('n', '<leader>cc', ':silent! pclose', {noremap = true})

-- remove find highlighting
vim.keymap.set('n', '<leader>/', ':nohl<CR>', {noremap = true})
