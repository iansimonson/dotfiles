return {
    { 'junegunn/fzf', build = 'fzf#install()' },
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
}
