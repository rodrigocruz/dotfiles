return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function window()
      return vim.api.nvim_win_get_number(0)
    end
    require('lualine').setup({
      options = {
        theme = 'dracula',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {window, 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress', require("recorder").displaySlots},
        lualine_z = {'location', require("recorder").recordingStatus}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {window, 'location'},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}

