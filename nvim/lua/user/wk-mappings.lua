local wk = require("which-key")
local dap = require("dap")

wk.register({
	["0"] = { ":Neotree filesystem focus left<CR>", "Focus Neotree" },
	["+"] = { "<C-a>", "Increment number" },
	["-"] = { "<C-x>", "Decrement number" },
	["<tab>"] = { ":b#<CR>", "Previous buffer" },
	a = {
		name = "ChatGPT",
		mode = { "n", "v" },
		a = { "<cmd>ChatGPTActAs<CR>", "Act as" },
		c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
		e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
		g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
		-- t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
		-- k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
		d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
		t = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
		o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
		s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
		f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
		x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
		-- r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
		l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
	},
	b = {
		name = "Buffers",
		A = { ":%bd<CR>", "Close All Buffers" },
		l = { ":Telescope buffers<CR>", "List Buffers in Telescope" },
		b = { ":FzfLua buffers<CR>", "List Buffers" },
		d = { ":Bdelete<CR>", "Close Buffer" },
		n = { ":bn<CR>", "Next Buffer" },
		p = { ":bp<CR>", "Prev Buffer" },
		o = { ":w <bar> %bd <bar> e# <bar> bd# <CR>", "Close Other Buffers" },
		s = { ":Scratch<CR>", "Open Scratch Buffer" },
	},
	c = {
		name = "Code",
		a = { ":Lspsaga code_action<CR>", "Code Actions" },
		c = { ":ContextToggle<CR>", "Context Toggle" },
		d = { vim.lsp.buf.definition, "Goto Definition" },
		-- f = { vim.lsp.buf.format, "Code Format" },
		f = {
			function()
				local conform = require("conform")
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			"Code Format",
		},
		h = { ":Lspsaga hover_doc<CR>", "Hover" },
		-- i = { ":DashWord<CR>", "Look Word in Dash" },
		i = { "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", "Toggle Inlay Hint" },
		l = {
			name = "Php/Laravel",
			a = { ":Laravel artisan<CR>", "Run Artisan Command" },
			i = { ":PhpactorImportClass<CR>", "Import Missing Class" },
			I = { ":PhpactorImportMissingClasses<CR>", "Import Missing Classes" },
			r = { ":Laravel routes<CR>", "List Routes" },
			v = { ":Laravel view-finder<CR>", "Goto Related View" },
		},
		m = { ":PhpactorContextMenu<CR>", "PHP Actor Menu" },
		o = { ":Lspsaga outline<CR>", "Outline" },
		p = { ":Lspsaga peek_definition<CR>", "Peek Definition" },
		-- q = { vim.lsp.buf.references, "References" },
		r = { vim.lsp.buf.rename, "Rename" },
		s = { ":Lspsaga finder<CR>", "Find References" },
		t = { ":Trouble<CR>", "Trouble Menu" },
		y = { ":TailwindFoldToggle<CR>", "Hide Tailwind Classes" },
		z = { ":LspRestart<CR>", "Restart Lsp" },
	},
	d = {
		name = "Debugging",
		b = { dap.toggle_breakpoint, "Set Breakpoint" },
		c = { dap.continue, "Continue" },
		C = { dap.run_to_cursor, "Run To Cursor" },
		e = { require("dapui").eval, "Eval" },
		s = { dap.step_over, "Step Over" },
		i = { dap.step_into, "Step Into" },
		o = { dap.step_out, "Step Out" },
		h = { require("dap.ui.widgets").hover, "Hover" },
		x = { dap.close, "Close" },
	},
	e = {
		name = "Errors",
		l = { ":Trouble diagnostics toggle filter.buf=0<CR>", "List Errors" },
		n = { vim.diagnostic.goto_next, "Next Error" },
		p = { vim.diagnostic.goto_prev, "Previous Error" },
		q = { ":Trouble quickfix<CR>", "Quickfix" },
		t = {
			function()
				require("lsp_lines").toggle()
			end,
			"Toggle Lsp Lines",
		},
	},
	f = {
		name = "File",
		["-"] = { "<CMD>Oil --float<CR>", "Open currrent folder" },
		d = {
			function()
				local confirm = vim.fn.confirm("Delete buffer and file?", "&Yes\n&No", 2)

				if confirm == 1 then
					os.remove(vim.fn.expand("%"))
					vim.api.nvim_buf_delete(0, { force = true })
				end
			end,
			"Delete Buffer and File",
		},
		l = { ":Telescope advanced_git_search search_log_content_file<CR>", "Search File in Git Log" },
		-- f = { ":Telescope find_files<CR>", "Find Files" },
		f = { ":FzfLua files<CR>", "Find Files" },
		g = { ":FzfLua git_status<CR>", "Git Files" },
		t = { ":Neotree filesystem toggle left<CR>", "Open Neotree" },
		o = { ":Neotree filesystem toggle current<CR>", "Open Neotree Current Window" },
		s = { ":Telescope smart_open<CR>", "Find Files" },
	},
	g = {
		name = "Git",
		b = { ":Gitsigns blame_line<CR>", "Git Blame Line" },
		d = { ":Gitsigns diffthis<CR>", "Diff this file" },
		f = { ":FzfLua git_status<CR>", "Git Files" },
		g = { ":Neogit<CR>", "Neogit" },
		h = { ":DiffviewFileHistory %<CR>", "Git File History" },
		l = { ":Telescope advanced_git_search search_log_content<CR>", "Search Commit Log" },
		-- l = { ":Telescope git_branches<CR>", "Git Branches" },
		n = { ":Gitsigns next_hunk<CR>", "Next Modification" },
		N = { ":Gitsigns prev_hunk<CR>", "Next Modification" },
		p = { ":Gitsigns preview_hunk<CR>", "Preview Change" },
		s = { ":Telescope git_status<CR>", "Git Status" },
		z = { ":LazyGit<CR>", "Open Lazy Git" },
	},
	h = {
		name = "Help",
		d = { ":Dash<CR>", "Dash" },
		o = {
			name = "DevDocs",
			a = { ":DevdocsUpdateAll<CR>", "DevDocs All" },
			o = { ":DevdocsOpenFloat<CR>", "DevDocs Open" },
			i = { ":DevdocsInstall<CR>", "DevDocs Install" },
			t = { ":DevdocsToggle<CR>", "DevDocs Toggle" },
			u = { ":DevdocsUpdate<CR>", "DevDocs Update" },
		},
		h = { ":FzfLua help_tags<CR>", "Help tags" },
		-- h = { function() require('telescope.builtin').help_tags() end, "Help Tags" },
	},
	i = { ":bp<CR>", "Prev Buffer" },
	j = {
		name = "Jump",
		c = { ":HopChar2<CR>", "Jump 2-char" },
		m = { ":FzfLua marks<CR>", "Jump to mark" },
		j = { ":HopPattern<CR>", "Jump to Pattern" },
		w = { ":HopWord<CR>", "Jump Word" },
	},
	m = {
		name = "Bookmarks",
		a = { ":lua require('harpoon.mark').add_file()<CR>", "Add Bookmark" },
		l = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "List Bookmarks" },
		n = { ":lua require('harpoon.ui').nav_next()<CR>", "Next Bookmark" },
		p = { ":lua require('harpoon.ui').nav_prev()<CR>", "Prev Bookmark" },
		t = { ":lua require('harpoon.mark').toggle_file()<CR>", "Toggle Bookmark" },
		r = { ":lua require('harpoon.mark').rm_file()<CR>", "Remove Bookmark" },
		-- m = { ":Fzflua marks<cr>", "list nvim marks" },
	},
	o = { ":bn<CR>", "Next Buffer" },
	p = {
		name = "Project",
		s = { "<cmd>SessionSave<cr>", "Save Session" },
		l = { "<cmd>SessionRestore<cr>", "Load Session" },
	},
	s = {
		name = "Search",
		a = { ":Ags<CR>", "Search word under cursor with Ags" },
		c = { ":nohlsearch<CR>", "Clear Search Highlight" },
		d = { ":Telescope dir live_grep<CR>", "Search in Folder" },
		l = {
			function()
				require("telescope.builtin").resume()
			end,
			"Resume Last Search",
		},
		p = { ":Telescope live_grep<CR>", "Live Grep" },
		r = { ":Spectre<CR>", "Open Spectre" },
		s = {
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			"Fuzzy Seach Current Buffer",
		},
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
		c = { ":ColorizerToggle<CR>", "Colorizer" },
		d = {
			name = "DB",
			{
				o = { "<CMD>Neotre close<CR><CMD>tabnew<CR><bar><bar><CMD>DBUI<CR>", "Open Dadbod UI" },
				c = { "<CMD>DBUIClose<CR><CMD>tabclose<CR>", "Close Dadbod UI" },
			},
		},
		h = { ":FzfLua command_history<CR>", "Command History" },
		i = { "<cmd>IconPickerYank<cr>", "Yank Icon" },
		k = { ":Telescope keymaps<CR>", "Keymaps" },
		l = { ":Lazy<CR>", "Open Lazy" },
		m = { ":Mason<CR>", "Open Mason" },
		-- r = { "<Plug>RestNvim", "Rest Client" },
		-- n = {
		-- 	name = "Notifications",
		-- 	d = { ":NoiceDismiss<CR>", "Dismiss Notification" },
		-- },
		n = { ":Telescope notify<CR>", "Notifications" },
		-- p = { ":NoNeckPain<CR>", "NoNeckPain" },
		p = { "<cmd>lua require('precognition').toggle()<CR>", "NoNeckPain" },
		q = { ":qa<CR>", "Quit" },
		r = { ":call VrcQuery()<CR>", "Rest Client" },
		w = { ":w<CR>", "Save" },
	},
	y = {
		name = "Yank",
		l = { ":Telescope neoclip<CR>", "Yank History" },
	},
	w = {
		name = "Windows",
		["="] = { "<C-w>=", "Balance windows" },
		d = { "<C-w>q", "Close window" },
		f = { ":FloatermToggle<CR>", "Toggle Terminal" },
		m = { ":lua require('maximize').toggle()<CR>", "Maximize Window" },
		n = { ":tabnew<CR>", "New Tab" },
		o = { ":only<CR>", "Close other wndows" },
		s = { ":split<CR>", "Split window vertically" },
		t = { ":tabclose<CR>", "Close Tab" },
		x = { "<cmd>close<CR>", "Close Current Split" },
		v = { ":vsplit<CR>", "Split window vertically" },
		w = { ":Twilight<CR>", "Twilight Mode" },
		z = { ":TZAtaraxis<CR>", "Ataraxis Mode" },
	},
	x = {
		name = "Xcode",
		{
			b = { ":XcodebuildBuild<CR>", "Xcode Build" },
			d = {
				name = "Xcode Debug",
				-- b = { require("xcodebuild.integrations.dap").toggle_breakpoint, "Toggle Breakpoint" },
				d = { require("xcodebuild.integrations.dap").build_and_debug, "Build & Debug" },
				x = { require("xcodebuild.integrations.dap").terminate_session, "Terminate Session" },
			},
			l = { ":XcodebuildToggleLogs<CR>", "Xcode Logs" },
			m = { ":XcodebuildPicker<CR>", "Xcode Menu" },
			p = { ":XcodebuildProjectManager<CR>", "Xcode Project Manager" },
			r = { ":XcodebuildBuildRun<CR>", "Xcode Run" },
		},
	},
	z = { ":ZenMode<CR>", "Zen Mode" },
}, { prefix = "<leader>" })

local leaderv = {
	c = {
		name = "code",
		c = { ":CarbonNow<CR>", "Carbon Now" },
		l = {
			name = "Php/Laravel",
			m = { ":PhpactorExtractMethod<CR>", "Extract Method" },
		},
		s = { ":CodeSnap<CR>", "CodeSnap" },
	},
	p = { '"_dP', "Paste Without Copy" },
	s = {
		name = "Search",
		s = { "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", "Search Selection" },
		w = { ":BrowserSearch<CR>", "Search Web" },
	},
}

wk.register(leaderv, {
	mode = "v",
	prefix = "<leader>",
})
