-- no longer using fzf directly, instead using telescope-fzf-native
return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        config = function()
            local tele = require('telescope')
            tele.setup({})
            tele.load_extension('fzf')
            tele.load_extension('ui-select')

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>f', builtin.git_files, { desc = '[f]ind git files' })
            vim.keymap.set('n', '<leader>sF', builtin.find_files, { desc = '[F]ind files' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>ss', builtin.grep_string, {})
            vim.keymap.set('n', '<leader>b', builtin.buffers, {})

            vim.keymap.set('n', '<leader>sf', function()
                builtin.current_buffer_fuzzy_find({
                    previewer = false,
                })
            end, { desc = '[sf] Fuzzily search in current buffer' })
        end,
    },
    --[[ { 'junegunn/fzf', build = 'fzf#install()' },
    {
        'junegunn/fzf.vim',
        dependencies = 'fzf',
        config = function()
            local map = vim.api.nvim_set_keymap
            map('n', '<leader>f', ':GFiles<CR>', { noremap = true })
            map('n', '<leader>F', ':Files<CR>', { noremap = true })
            map('n', '<leader>b', ':Buffers<CR>', { noremap = true })
            map('n', '<leader>sf', ':BLines<CR>', { noremap = true })
        end,
    },
    --]]
}
