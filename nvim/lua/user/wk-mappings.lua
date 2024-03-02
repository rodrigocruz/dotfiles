local wk = require("which-key")
local dap = require("dap")

wk.register({
	["0"] = { ":Neotree filesystem focus right<CR>", "Focus Neotree" },
	["<tab>"] = { ":bprevious<CR>", "Previous buffer" },
	b = {
		name = "Buffers",
		b = { ":FzfLua buffers<CR>", "List buffers" },
		C = { ":bufdo bdelete<CR>", "Close All Open Buffers" },
	},
	c = {
		name = "Code",
		a = { vim.lsp.buf.code_action, "Code Actions" },
		f = { vim.lsp.buf.format, "Code Format" },
	},
	d = {
		name = "Debuggind",
		b = { dap.toggle_breakpoint, "Set Breakpoint" },
		c = { dap.continue, "Continue" },
		x = { dap.close, "Close" },
	},
	e = {
		name = "Errors",
		l = { ":TroubleToggle document_diagnostics<CR>", "List Errors" },
		n = { vim.diagnostic.goto_next, "Next Error" },
		p = { vim.diagnostic.goto_prev, "Previous Error" },
		q = { ":TroubleToggle quickfix<CR>", "Quickfix" },
	},
	f = {
		name = "File",
		r = { ":FzfLua oldfiles<CR>", "Recent Files" },
		t = { ":Neotree filesystem toggle right<CR>", "Open Neotree" },
		f = { ":FzfLua files<CR>", "Find files" },
	},
	g = {
		name = "Git",
		s = { ":Neogit<CR>", "Git Status" },
	},
	h = {
		name = "Help",
		h = { ":FzfLua help_tags<CR>", "Help tags" },
	},
	s = {
		name = "Search",
		c = { ":nohlsearch<CR>", "Clear Search Highlight" },
		p = { ":FzfLua live_grep<CR>", "Search in project" },
		l = { ":FzfLua resume<CR>", "Resume last search" },
		s = { ":FzfLua lgrep_curbuf<CR>", "FuzZy search current buffer" },
	},
    t = {
        name = "Test",
        n = { ":TestNearest<CR>", "Test Nearest"},
        f = { ":TestFile<CR>", "Test File"},
        s = { ":TestSuite<CR>", "Test Suite"},
        l = { ":TestLast<CR>", "Test Last"},
        v = { ":TestVisit<CR>", "Test Visit"},
    },
	w = {
		name = "Windows",
		v = { ":vsplit<CR>", "Split window vertically" },
		d = { "<C-w>q", "Close window" },
		o = { ":only<CR>", "Close other wndows" },
	},
}, { prefix = "<leader>" })
