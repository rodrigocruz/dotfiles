local wk = require("which-key")
local dap = require("dap")

wk.register({
	["0"] = { ":Neotree filesystem focus left<CR>", "Focus Neotree" },
	["<tab>"] = { ":b#<CR>", "Previous buffer" },
	b = {
		name = "Buffers",
		-- b = { ":FzfLua buffers<CR>", "List buffers" },
        b = { function() require('telescope.builtin').buffers() end, "List Buffers" },
		d = { ":Bdelete<CR>", "Close All Open Buffers" },
        o = { ":BWipeout other<CR>", "Close Other Buffers" },
	},
	c = {
		name = "Code",
		a = { vim.lsp.buf.code_action, "Code Actions" },
        d = { vim.lsp.buf.definition, "Goto Definition" },
		f = { vim.lsp.buf.format, "Code Format" },
        h = { vim.lsp.buf.hover, "Hover" },
        r = { vim.lsp.buf.rename, "Rename" },
        z = { vim.lsp.buf.references, "References" },
	},
	d = {
		name = "Debugging",
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
        -- r = { function() require('telescope.builtin').resume() end, "Recent Search" },
		t = { ":Neotree filesystem toggle left<CR>", "Open Neotree" },
		-- f = { ":FzfLua files<CR>", "Find files" },
        f = { function() require('telescope.builtin').find_files() end, "Find files" },
	},
	g = {
		name = "Git",
		s = { ":Neogit<CR>", "Git Status" },
	},
	h = {
		name = "Help",
		h = { ":FzfLua help_tags<CR>", "Help tags" },
        -- h = { function() require('telescope.builtin').help_tags() end, "Help Tags" },
	},
    n = {
        name = "Notifications",
        d = { ":NoiceDismiss<CR>", "Dismiss Notification"},
    },
    p = {
        name = "PHP",
            m = { ":PhpactorContextMenu<CR>", "PHP Actor Menu"},
    },
	s = {
		name = "Search",
        a = { ":Ags<CR>", "Search word under cursor wirh Ags"},
		c = { ":nohlsearch<CR>", "Clear Search Highlight" },
		-- p = { ":FzfLua live_grep<CR>", "Search in project" },
        p = { ":Telescope live_grep<CR>", "Search in project" },
		-- l = { ":FzfLua resume<CR>", "Resume last search" },
        l = { function() require('telescope.builtin').resume() end, "Resume Last Search" },
		-- s = { ":FzfLua lgrep_curbuf<CR>", "FuzZy search current buffer" },
        s = { function() require('telescope.builtin').current_buffer_fuzzy_find() end, "Fuzzy Seach Current Buffer" },
        -- j = { function() require('telescope.builtin').lsp_document_symbols() end, "Find Symbols" },
        j = { ":FzfLua lsp_document_symbols<CR>", "Find Symbols" },
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
