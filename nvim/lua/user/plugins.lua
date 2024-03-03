local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Color scheme
	{ import = "user.plugins.tokyonight" },

	{ import = "user.plugins.alpha" },

	{ import = "user.plugins.autopairs" },

	-- { import = "user.plugins.catppuccin" },

	{ import = "user.plugins.completions" },

	{ import = "user.plugins.debugging" },

	{ import = "user.plugins.fzf-lua" },

	{ import = "user.plugins.lsp-config" },

	{ import = "user.plugins.lualine" },

	{ import = "user.plugins.neogit" },

	{ import = "user.plugins.neotree" },

	{ import = "user.plugins.none-ls" },

	{ import = "user.plugins.telescope" },

	{ import = "user.plugins.tree-sitter" },

	{ import = "user.plugins.trouble" },

	{ import = "user.plugins.which-key" },

	-- Commenting support.
	{ import = "user.plugins.vim-commentary" },

	-- Add, change, and delete surrounding text.
	{ "tpope/vim-surround" },

	-- Allow plugins to enable repeating of commands.
	{ "tpope/vim-repeat" },

	-- Navigate seamlessly between Vim windows and Tmux panes.
	{ "christoomey/vim-tmux-navigator" },

	-- Enable * searching with visually selected text.
	{ "nelstrom/vim-visual-star-search" },

	-- Text objects for HTML attributes.
	{ "whatyouhide/vim-textobj-xmlattr", dependencies = "kana/vim-textobj-user" },

	-- Add smooth scrolling to avoid jarring jumps
	-- { "karb94/neoscroll.nvim", config = true },

	-- Automatically fix indentation when pasting code.
	{ import = "user.plugins.vim-pasta" },

	-- Display buffers as tabs.
	{ import = "user.plugins.bufferline" },

	-- Git integration.
	{ import = "user.plugins.gitsigns" },

	--- Floating terminal.
	{ import = "user.plugins.floaterm" },

	-- Testing helper
	{ import = "user.plugins.vim-test" },

	-- All closing buffers without closing the split window.
	{ import = "user.plugins.bufdelete" },

	-- Split arrays and methods onto multiple lines, or join them back up.
	{ import = "user.plugins.treesj" },

	-- Show file and LSP context in a bar at the top of the screen.
	{ import = "user.plugins.barbecue" },

	-- Colorize Hex Codes
	{ import = "user.plugins.colorizer" },

	-- Display indentation lines.
	{ import = "user.plugins.indent-blankline" },

	-- Project Configuration.
	{ import = "user.plugins.projectionist" },

	-- PHP Refactoring Tools
	{ import = "user.plugins.phpactor" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	install = {
		colorscheme = { "tokyonight", "habamax" },
	},
})
