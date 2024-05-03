return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local function window()
			return vim.api.nvim_win_get_number(0)
		end
		local function xcodebuild_device()
			if vim.g.xcodebuild_platform == "macOS" then
				return " macOS"
			end

			if vim.g.xcodebuild_os then
				return " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
			end

			return " " .. vim.g.xcodebuild_device_name
		end
		require("lualine").setup({
			options = {
				theme = "dracula",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "searchcount", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{ "' ' .. vim.g.xcodebuild_last_status", color = { fg = "#a6e3a1" } },
					-- { "'󰙨 ' .. vim.g.xcodebuild_test_plan", color = { fg = "#a6e3a1", bg = "#161622" } },
					-- { xcodebuild_device, color = { fg = "#f9e2af", bg = "#161622" } },
				},
				lualine_y = { "progress", require("recorder").displaySlots },
				lualine_z = { "location", require("recorder").recordingStatus },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { window, "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "nvim-dap-ui", "quickfix", "trouble", "nvim-tree", "lazy", "mason" },
		})
	end,
}
