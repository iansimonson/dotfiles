vim.g.mapleader = ','

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
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

vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'

-- these are from kickstart.nvim
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

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

-- shortcuts for diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- terminal stuff
vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-n>')

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('default-terminal-dressing', {clear = true}),
    callback = function(_)
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- reload files e.g. when git branching etc.
local reload_all_buffers = function()
    local current_buf = vim.api.nvim_get_current_buf()
    vim.cmd(':bufdo e!<CR>')
    vim.cmd(':buf ' .. current_buf)
end
vim.keymap.set('n', '<leader>raf', reload_all_buffers, {desc = 'Reload all open buffers' })


-- enable plugins
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
require("funcs")
