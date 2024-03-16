return {
    { 'nvim-lua/plenary.nvim' },
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim', }, opts = { signs = false } },
    {
        'flazz/vim-colorschemes',
        lazy = false,
        config = function()
            vim.cmd([[
        set termguicolors
        set background=dark
        syntax on
        colorscheme zenburn
        ]])
        end
    },
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
    {
        'numToStr/Comment.nvim',
        opts = {
            lazy = false,
        },
        config = function()
            require('Comment').setup()
        end,
    },
}
