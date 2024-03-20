return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
        'flazz/vim-colorschemes',
        lazy = false,
    },
    {
        'flrnd/candid.vim',
        lazy = false,
    },
}
