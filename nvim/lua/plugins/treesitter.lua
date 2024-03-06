return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        config = function()
            local ts = require('nvim-treesitter.configs')
            ts.setup({
                ensure_installed = { "c", "lua", "odin" },
                sync_install = false,
                hightlight = {
                    enable = true,
                },
            })
            vim.cmd(':TSEnable highlight')
        end
    },
}
