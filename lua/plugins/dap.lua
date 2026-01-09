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
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
                {
                    name = "Launch with args",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = function()
                        local input = vim.fn.input("Args: ")
                        return vim.fn.split(input, " ")
                    end,
                },
            }
            dap.configurations.c = lldb_config
            dap.configurations.cpp = lldb_config
            dap.configurations.rust = lldb_config

            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

            vim.keymap.set(
                "n",
                "<F1>",
                dap.continue,
                { desc = "DAP continue" }
            )
            vim.keymap.set(
                "n",
                "<F2>",
                dap.step_into,
                { desc = "DAP step into" }
            )
            vim.keymap.set(
                "n",
                "<F3>",
                dap.step_over,
                { desc = "DAP step over" }
            )
            vim.keymap.set(
                "n",
                "<F4>",
                dap.step_out,
                { desc = "DAP step out" }
            )
            vim.keymap.set("n", "<F11>", dap.restart, { desc = "DAP restart" })
            vim.keymap.set(
                "n",
                "<F12>",
                dap.terminate,
                { desc = "DAP terminate" }
            )
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {},
        config = function(_, opts)
            local ui = require("dapui")
            local dap = require("dap")
            ui.setup(opts)
            vim.keymap.set("n", "<leader>?", function()
                ui.eval(nil, { enter = true })
            end)
            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
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
