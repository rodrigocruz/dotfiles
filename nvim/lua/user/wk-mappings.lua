local wk = require("which-key")
local dap = require("dap")

wk.register({
	["0"] = { ":Neotree filesystem focus left<CR>", "Focus Neotree" },
	["<tab>"] = { ":b#<CR>", "Previous buffer" },
	b = {
		name = "Buffers",
		-- b = { ":FzfLua buffers<CR>", "List buffers" },
		b = {
			function()
				require("telescope.builtin").buffers()
			end,
			"List Buffers",
		},
		d = { ":Bdelete<CR>", "Close All Open Buffers" },
        n = { ":bn<CR>", "Next Buffer" },
        p = { ":bp<CR>", "Prev Buffer" },
		o = { ":BWipeout other<CR>", "Close Other Buffers" },
        s = { ":Scratch<CR>", "Open Scratch Buffer in a Split" },
	},
	c = {
		name = "Code",
		a = { ":Lspsaga code_action<CR>", "Code Actions" },
		d = { vim.lsp.buf.definition, "Goto Definition" },
		f = { vim.lsp.buf.format, "Code Format" },
		h = { vim.lsp.buf.hover, "Hover" },
        i = { ":DashWord<CR>", "Look Word in Dash" },
        s = { ":Lspsaga finder<CR>", "Find References" },
		p = { ":Lspsaga peek_definition<CR>", "Peek Definition" },
		r = { vim.lsp.buf.rename, "Rename" },
        q = { vim.lsp.buf.references, "References" },
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
        ["-"] = { "<CMD>Oil --float<CR>", "Open currrent folder" },
		r = { ":FzfLua oldfiles<CR>", "Recent Files" },
		-- r = { function() require('telescope.builtin').resume() end, "Recent Search" },
		t = { ":Neotree filesystem toggle left<CR>", "Open Neotree" },
		-- f = { ":FzfLua files<CR>", "Find files" },
		f = {
			function()
				require("telescope.builtin").find_files()
			end,
			"Find files",
		},
	},
	g = {
		name = "Git",
        b = { ":Gitsigns blame_line<CR>", "Git Blame Line"},
        l = { ":LazyGit<CR>", "Open Lazy Git"},
        p = { ":Gitsigns preview_hunk<CR>", "Preview Change" },
		s = { ":Neogit<CR>", "Git Status" },
	},
	h = {
		name = "Help",
		h = { ":FzfLua help_tags<CR>", "Help tags" },
		-- h = { function() require('telescope.builtin').help_tags() end, "Help Tags" },
	},
    i = { ":bp<CR>", "Prev Buffer" },
	j = {
		name = "Jump",
		j = { ":HopChar2<CR>", "Jump 2-char" },
		p = { ":HopPattern<CR>", "Jump to Pattern" },
		w = { ":HopWord<CR>", "Jump Word" },
	},
    m = {
        name = "Bookmarks",
        a = { ":BookmarksMark<CR>", "Add Bookmark" },
        c = { ":BookmarksCommands<CR>", "Bookmar Commands"},
        l = { ":BookmarksGoto<CR>" , "Goto Bookmark"},
        r = { ":BookmarksGotoRecent<CR>", "Goto Recent Bookmark"},
    },
	n = {
		name = "Notifications",
		d = { ":NoiceDismiss<CR>", "Dismiss Notification" },
	},
    o = { ":bn<CR>", "Next Buffer" },
    p = { "<CMD>_dP"},
	-- p = {
	-- 	name = "PHP",
	-- 	m = { ":PhpactorContextMenu<CR>", "PHP Actor Menu" },
	-- },
    -- p = { ":bn<CR>", "Next Buffer" },
	s = {
		name = "Search",
		a = { ":Ags<CR>", "Search word under cursor with Ags" },
		c = { ":nohlsearch<CR>", "Clear Search Highlight" },
        d = { ":Telescope dir live_grep<CR>", "Search in Current Folder" },
		-- p = { ":FzfLua live_grep<CR>", "Search in project" },
		p = { ":Telescope live_grep<CR>", "Search in project" },
		-- l = { ":FzfLua resume<CR>", "Resume last search" },
		l = {
			function()
				require("telescope.builtin").resume()
			end,
			"Resume Last Search",
		},
		-- s = { ":FzfLua lgrep_curbuf<CR>", "FuzZy search current buffer" },
		s = {
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			"Fuzzy Seach Current Buffer",
		},
		-- j = { function() require('telescope.builtin').lsp_document_symbols() end, "Find Symbols" },
		j = { ":FzfLua lsp_document_symbols<CR>", "Find Symbols" },
		u = { ":Telescope grep_string<CR>", "Find Word Under Cursor" },
		w = { ":BrowserSearch<CR>", "Search Web" },
	},
	t = {
		name = "Test",
		n = { ":TestNearest<CR>", "Test Nearest" },
		f = { ":TestFile<CR>", "Test File" },
		s = { ":TestSuite<CR>", "Test Suite" },
		l = { ":TestLast<CR>", "Test Last" },
		v = { ":TestVisit<CR>", "Test Visit" },
	},
    u = {
        name = "Utils",
        d = {
            name = "DB",
            {
                o = { "<CMD>Neotre close<CR><CMD>tabnew<CR><bar><bar><CMD>DBUI<CR>", "Open Dadbod UI" },
                c = { "<CMD>DBUIClose<CR><CMD>tabclose<CR>", "Close Dadbod UI" },
            }
        },
        l = { ":Lazy<CR>", "Open Lazy" },
        m = { ":Mason<CR>", "Open Mason" },
        -- r = { "<Plug>RestNvim", "Rest Client" },
        r = { ":call VrcQuery()<CR>", "Rest Client" },
    },
	w = {
		name = "Windows",
		d = { "<C-w>q", "Close window" },
        m = { ":lua require('maximize').toggle()<CR>", "Maximize Window" },
		o = { ":only<CR>", "Close other wndows" },
        s = { ":split<CR>", "Split window vertically" },
        v = { ":vsplit<CR>", "Split window vertically" },
	},
}, { prefix = "<leader>" })

local leaderv = {
    s = {
        name = "Search",
        s = { "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", "Seach Selection"},
        w = { ":BrowserSearch<CR>", "Search Web" },
    }
}

wk.register(leaderv, {
	mode = "v",
	prefix = "<leader>",
})
