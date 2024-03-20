return {
    {
        'williamboman/mason.nvim',
        config = function()
            local mason = require('mason')
            mason.setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local maslsp = require('mason-lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            maslsp.setup {
                ensure_installed = { "lua_ls", "ols", "asm_lsp", "clangd" }
            }
            maslsp.setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    require('lspconfig').lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' }
                                }
                            }
                        }

                    })
                end
            }
        end,
        dependencies = {'mason.nvim', 'nvim-cmp'}
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {clear = true}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, {buffer = ev.buf, desc = 'LSP: ' .. desc})
                    end

                    -- most used probably
                    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                    map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
                    map('K', vim.lsp.buf.hover, 'Hover Do[K]umentation')
                    -- TODO: replace this with telescope fuzzy finding
                    -- map('<leader>ds', vim.lsp.buf.document_symbols, '[D]ocument [S]ymbols')

                    map('<leader>df', function()
                        vim.lsp.buf.format { async = true }
                    end, '[F]ormat')

                    -- used occasionally?
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                    map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, {buffer = ev.buf, desc = 'LSP: Signature Help'})

                    -- useful in some LSPs but not all/many
                    map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame Symbol')
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                    -- could probably remove, will I ever use these?
                    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set('n', '<leader>wl', function()
                    --     print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
                    -- end, opts)
                end,
            })
        end,
        dependencies = 'mason-lspconfig.nvim',
    },
}
