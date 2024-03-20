-- https://www.youtube.com/watch?v=ZCkG47xGOl4

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values

local preview_colorschemes_impl = function(opts)
    local current_select = vim.g.colors_name

    local next_color = function(bufnr)
        actions.move_selection_next(bufnr)
        local selected = action_state.get_selected_entry()
        vim.cmd.colorscheme(selected[1])
    end

    local previous_color = function(bufnr)
        actions.move_selection_previous(bufnr)
        local selected = action_state.get_selected_entry()
        vim.cmd.colorscheme(selected[1])
    end

    local reset = function(bufnr)
        actions.close(bufnr)
        vim.cmd.colorscheme(current_select)
    end

    opts = opts or {}
    pickers.new(opts, {
        finder = finders.new_table(vim.fn.getcompletion("", "color")),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(bufnr, map)
            actions.select_default:replace(function()
                actions.close(bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd('colorscheme ' .. selection[1])
            end)


            map('i', '<C-j>', next_color)
            map('i', '<C-k>', previous_color)
            map('i', '<C-n>', next_color)
            map('i', '<C-p>', previous_color)
            map('n', '<esc>', reset)
            return true
        end,
    }):find()
end

Preview_colorschemes = function()
    preview_colorschemes_impl(require('telescope.themes').get_dropdown({}))
end

