return {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    keys = {
        -- { '<leader>n', ':Neotree reveal toggle<CR>' },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            's1n7ax/nvim-window-picker',
            opts = {
                filter_rules = {
                    autoselect_one = true,
                    include_current_win = false,
                    bo = {
                        filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                        buftype = { 'terminal', "quickfix" },
                    },
                },
                highlights = {
                    statusline = {
                        focused = {
                            bg = '#9d7cd8',
                        },
                        unfocused = {
                            bg = '#9d7cd8',
                        },
                    },
                },
            },
        },
    },
    opts = {
        close_if_last_window = true,
        hide_root_node = true,
        sources = {
            "filesystem",
            "buffers",
            "git_status",
            "document_symbols",
        },
        source_selector = {
            winbar = true,
            statusline = false,
            separator = { left = "", right = "" },
            show_separator_on_edge = true,
            highlight_tab = "SidebarTabInactive",
            highlight_tab_active = "SidebarTabActive",
            highlight_background = "StatusLine",
            highlight_separator = "SidebarTabInactiveSeparator",
            highlight_separator_active = "SidebarTabActiveSeparator",
        },
        default_component_configs = {
            indent = {
                padding = 0,
            },
            name = {
                use_git_status_colors = false,
                highlight_opened_files = true,
            },
        },
        window = {
            mappings = {
                ['h'] = function(state)
                    local node = state.tree:get_node()
                    if node.type == 'directory' and node:is_expanded() then
                        require('neo-tree.sources.filesystem').toggle_directory(state, node)
                    else
                        require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                    end
                end,
                ['l'] = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    if node.type == 'directory' then
                        if not node:is_expanded() then
                            require('neo-tree.sources.filesystem').toggle_directory(state, node)
                        elseif node:has_children() then
                            require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                        end
                    end
                    if node.type == 'file' then
                        require('neo-tree.utils').open_file(state, path)
                    end
                end,
                ['e'] = function()
                    vim.api.nvim_exec('Neotree focus filesystem right', true)
                end,
                ['b'] = function()
                    vim.api.nvim_exec('Neotree focus buffers right', true)
                end,
                ['g'] = function()
                    vim.api.nvim_exec('Neotree focus git_status right', true)
                end,
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_by_name = {
                    ".git",
                },
            },
            -- follow_current_file = {
            --   enabled = true,
            -- },
            group_empty_dirs = false
        },
    },
}
