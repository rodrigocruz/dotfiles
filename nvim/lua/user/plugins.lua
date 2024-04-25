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
	{ import = "user.plugins.everforest" },

	{ import = "user.plugins.mason" },

	{ import = "user.plugins.alpha" },

	{ import = "user.plugins.autopairs" },

	{ import = "user.plugins.nvim-cmp" },

	{ import = "user.plugins.debugging" },

	{ import = "user.plugins.fzf-lua" },

	{ import = "user.plugins.lsp-config" },

	{ import = "user.plugins.lualine" },

	{ import = "user.plugins.neogit" },

	{ import = "user.plugins.neotree" },

	{ import = "user.plugins.telescope" },

	{ import = "user.plugins.treesitter" },

	{ import = "user.plugins.trouble" },

	{ import = "user.plugins.which-key" },

	-- Commenting support.
	{ import = "user.plugins.vim-commentary" },

	-- Add, change, and delete surrounding text.
	{ import = "user.plugins.nvim-surround" },

	-- Allow plugins to enable repeating of commands.
	{ "tpope/vim-repeat" },

	-- Navigate seamlessly between Vim windows and Tmux panes.
	{ "christoomey/vim-tmux-navigator" },

	-- Enable * searching with visually selected text.
	{ "nelstrom/vim-visual-star-search" },

	-- Text objects for HTML attributes.
	{ "whatyouhide/vim-textobj-xmlattr", dependencies = "kana/vim-textobj-user" },

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
	-- { import = "user.plugins.barbecue" },

	-- Colorize Hex Codes
	{ import = "user.plugins.colorizer" },

	-- Display indentation lines.
	{ import = "user.plugins.indent-blankline" },

	-- Project Configuration.
	{ import = "user.plugins.projectionist" },

	-- PHP Refactoring Tools
	{ import = "user.plugins.phpactor" },

	{ import = "user.plugins.nvim-bqf" },

	{ import = "user.plugins.vim-ags" },

	{ import = "user.plugins.vim-dadbod" },

	{ import = "user.plugins.ui" },

	{ import = "user.plugins.noice" },

	{ import = "user.plugins.searchbox" },

	{ import = "user.plugins.oil" },

	{ import = "user.plugins.lsp-saga" },

	{ import = "user.plugins.hop" },

	{ import = "user.plugins.browser-search" },

	{ import = "user.plugins.maximize" },

	{ import = "user.plugins.rest" },

	{ import = "user.plugins.dash" },

	-- Automatically set the working directory to the project root.
	{ import = "user.plugins.vim-rooter" },

	{ import = "user.plugins.ts-error-translator" },

	{ import = "user.plugins.dir-telescope" },

	"sindrets/diffview.nvim",

	{ import = "user.plugins.lazygit" },

	-- { import = "user.plugins.bookmarks" },

	{ import = "user.plugins.scratch" },

	{ "pteroctopus/faster.nvim" },

	{ "nvim-neotest/nvim-nio" },

	{ import = "user.plugins.nvim-recorder" },

	{ import = "user.plugins.laravel" },

	{ import = "user.plugins.tailwind-fold" },

	-- { import = "user.plugins.typescript-tools" },

	{ import = "user.plugins.spectre" },

	-- { "mg979/vim-visual-multi" },

	{ import = "user.plugins.garbage-day" },

	{ import = "user.plugins.codeium" },

	{ import = "user.plugins.neoclip" },

	{ import = "user.plugins.chatgpt" },

	{ import = "user.plugins.matchup" },

	{ import = "user.plugins.spider" },

	{ import = "user.plugins.devdocs" },

	{ import = "user.plugins.smooth-cursor" },

	{ import = "user.plugins.codesnap" },

	{ import = "user.plugins.carbon" },

	{ import = "user.plugins.tidy" },

	{ import = "user.plugins.harpoon" },

	{ import = "user.plugins.smart-open" },

	{ import = "user.plugins.ui-select" },

	{ import = "user.plugins.git-search" },

	{ import = "user.plugins.context" },

	{ import = "user.plugins.auto-session" },

	{ import = "user.plugins.dressing" },

	{ import = "user.plugins.formatting" },

	{ import = "user.plugins.linting" },

	{ import = "user.plugins.neck" },
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
