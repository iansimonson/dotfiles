return {
    { 'nvim-lua/plenary.nvim' },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim', },
        opts = { signs = false },
    },
    { 'tpope/vim-fugitive' },
    {
        'numToStr/Comment.nvim',
        opts = {
            lazy = false,
        },
        config = function()
            require('Comment').setup()
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', },
        config = function()
            require('lualine').setup()
        end,
    },
}
