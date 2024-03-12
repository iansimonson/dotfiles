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

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.hidden = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.relativenumber = true
vim.opt.number = true

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
