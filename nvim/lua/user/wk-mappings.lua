local wk = require("which-key")
local dap = require("dap")

wk.register({
	["0"] = { ":Neotree filesystem focus left<CR>", "Focus Neotree" },
	["<tab>"] = { ":b#<CR>", "Previous buffer" },
	b = {
		name = "Buffers",
		-- b = { ":FzfLua buffers<CR>", "List buffers" },
        A = { ":%bd<CR>", "Close All Buffers" },
		b = {
			function()
				require("telescope.builtin").buffers()
			end,
			"List Buffers",
		},
		d = { ":Bdelete<CR>", "Close Buffer" },
        n = { ":bn<CR>", "Next Buffer" },
        p = { ":bp<CR>", "Prev Buffer" },
		o = { ":w <bar> %bd <bar> e# <bar> bd# <CR>", "Close Other Buffers" },
        s = { ":Scratch<CR>", "Open Scratch Buffer" },
	},
	c = {
		name = "Code",
		a = { ":Lspsaga code_action<CR>", "Code Actions" },
		d = { vim.lsp.buf.definition, "Goto Definition" },
		f = { vim.lsp.buf.format, "Code Format" },
		h = { vim.lsp.buf.hover, "Hover" },
        i = { ":DashWord<CR>", "Look Word in Dash" },
        l = {
            name = "Php/Laravel",
            a = { ":Laravel artisan<CR>", "Run Artisan Command" },
            i = { ":PhpactorImportClass<CR>", "Import Missing Class" },
            I = { ":PhpactorImportMissingClasses<CR>", "Import Missing Classes" },
            r = { ":Laravel routes<CR>", "List Routes" },
            v = { ":Laravel view-finder<CR>", "Goto Related View" },
        },
        m = { ":PhpactorContextMenu<CR>", "PHP Actor Menu" },
		p = { ":Lspsaga peek_definition<CR>", "Peek Definition" },
        q = { vim.lsp.buf.references, "References" },
        r = { vim.lsp.buf.rename, "Rename" },
        s = { ":Lspsaga finder<CR>", "Find References" },
        t = { ":TailwindFoldToggle<CR>", "Hide Tailwind Classes" },
        z = { ":LspRestart<CR>", "Restart Lsp" },
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
        h = { ":DiffviewFileHistory %<CR>", "Git File History" },
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
        a = { ":BookmarksMark<CR>", "Toggle Bookmark" },
        c = { ":BookmarksCommands<CR>", "Bookmar Commands"},
        l = { ":BookmarksGoto<CR>" , "Goto Bookmark"},
        r = { ":BookmarksGotoRecent<CR>", "Goto Recent Bookmark"},
    },
	n = {
		name = "Notifications",
		d = { ":NoiceDismiss<CR>", "Dismiss Notification" },
	},
    o = { ":bn<CR>", "Next Buffer" },
    p = { "<CMD>_dP", "Paste Without Copy" },
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
        q = { ":qa<CR>", "Quit" },
        r = { ":call VrcQuery()<CR>", "Rest Client" },
        w = { ":w<CR>", "Save" },
    },
	w = {
		name = "Windows",
		d = { "<C-w>q", "Close window" },
        m = { ":lua require('maximize').toggle()<CR>", "Maximize Window" },
		o = { ":only<CR>", "Close other wndows" },
        s = { ":split<CR>", "Split window vertically" },
        t = { ":tabclose<CR>", "Close Tab" },
        v = { ":vsplit<CR>", "Split window vertically" },
	},
}, { prefix = "<leader>" })

local leaderv = {
    c = {
        name = "code",
        l = {
            name = "Php/Laravel",
            m = { ":PhpactorExtractMethod<CR>", "Extract Method" },
        },
    },
    s = {
        name = "Search",
        s = { "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", "Search Selection"},
        w = { ":BrowserSearch<CR>", "Search Web" },
    }
}

wk.register(leaderv, {
	mode = "v",
	prefix = "<leader>",
})
