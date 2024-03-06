return {
    {'flazz/vim-colorschemes',
    lazy = false,
    config = function()
        vim.cmd([[
        set termguicolors
        set background=dark
        syntax on
        colorscheme zenburn
        ]])
    end},
    --{
    --    'flrnd/candid.vim',
    --    lazy = false,
    --    priority = 1000,
    --    config = function()
    --        vim.cmd([[
    --        set termguicolors
    --        set background=dark
    --        syntax on
    --        colorscheme candid
    --        ]])
    --    end,
    --},
    'tpope/vim-fugitive',
}
