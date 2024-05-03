return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"wojciech-kulik/xcodebuild.nvim",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		local xcodebuild = require("xcodebuild.integrations.dap")
		local codelldbPath = os.getenv("HOME") .. "/Workspace/tools/codelldb-aarch64-darwin/extension/adapter/codelldb"

		xcodebuild.setup(codelldbPath)

		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
		}

		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9000,
			},
		}
	end,
}
