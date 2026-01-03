return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			require("dap-python").setup("uv")

			dap.adapters.lldb = {
				type = "executable",
				command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
				name = "lldb",
			}
			local lldb_config = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			dap.configurations.c = lldb_config
			dap.configurations.cpp = lldb_config
			dap.configurations.rust = lldb_config

			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "dap continue" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "dap step into" })
			vim.keymap.set("n", "<leader>dov", dap.step_over, { desc = "dap step over" })
			vim.keymap.set("n", "<leader>dou", dap.step_out, { desc = "dap step into" })
			vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "dap restart" })
			vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "dap terminate" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		opts = {},
		config = function(_, opts)
			local ui = require("dapui")
			ui.setup(opts)
			vim.keymap.set("n", "<leader>duo", ui.open, { desc = "dap-ui open" })
			vim.keymap.set("n", "<leader>duc", ui.close, { desc = "dap-ui close" })
			vim.keymap.set("n", "<leader>?", function()
				ui.eval(nil, { enter = true })
			end)
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
}
