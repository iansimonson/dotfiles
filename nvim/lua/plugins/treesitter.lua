return {
    {
        'nvim-treesitter/nvim-treesitter',
        tag = "v0.10.0",
        build = ':TSUpdate',
        lazy = false,
        config = function()
            vim.filetype.add({
                extension = {
                    odin = 'odin'
                }
            })

            local ts = require('nvim-treesitter.configs')
            ts.setup {
                ensure_installed = { "c", "lua", "odin" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                },
            }
        end
    },
}
