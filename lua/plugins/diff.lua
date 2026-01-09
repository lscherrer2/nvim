return {
    {
        "echasnovski/mini.diff",
        version = false,
        lazy = false,
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                source = diff.gen_source.none(),
                view = {
                    style = "sign",
                    signs = { add = "+", change = "~", delete = "-" },
                    priority = 199,
                },
                mappings = {
                    apply = "gh",
                    reset = "gH",
                    textobject = "gh",
                    goto_first = "[H",
                    goto_prev = "[h",
                    goto_next = "]h",
                    goto_last = "]H",
                },
            })

            -- Use consistent red/green highlighting instead of word-level diff
            local function set_diff_highlights()
                vim.api.nvim_set_hl(0, "MiniDiffOverContext", { link = "MiniDiffOverDelete" })
                vim.api.nvim_set_hl(0, "MiniDiffOverChange", { link = "MiniDiffOverDelete" })
                vim.api.nvim_set_hl(0, "MiniDiffOverContextBuf", { link = "MiniDiffOverAdd" })
                vim.api.nvim_set_hl(0, "MiniDiffOverChangeBuf", { link = "MiniDiffOverAdd" })
            end
            set_diff_highlights()
            vim.api.nvim_create_autocmd("ColorScheme", { callback = set_diff_highlights })

            vim.opt.autoread = false
            vim.opt.updatetime = 500

            local saved_state = {}

            local function save_buffer_state(bufnr)
                local file = vim.api.nvim_buf_get_name(bufnr)
                if file == "" or vim.fn.filereadable(file) ~= 1 then
                    return
                end
                local current_lines =
                    vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
                local disk_lines = vim.fn.readfile(file)
                saved_state[bufnr] = {
                    original = current_lines,
                    disk = disk_lines,
                    showing_disk = false,
                }
            end

            local function is_overlay_enabled(bufnr)
                local buf_data = diff.get_buf_data(bufnr)
                return buf_data and buf_data.overlay
            end

            local function toggle_disk_view(bufnr)
                local state = saved_state[bufnr]
                if not state then
                    return
                end

                if state.showing_disk then
                    vim.api.nvim_buf_set_lines(
                        bufnr,
                        0,
                        -1,
                        false,
                        state.original
                    )
                    if is_overlay_enabled(bufnr) then
                        diff.toggle_overlay(bufnr)
                    end
                    state.showing_disk = false
                    vim.bo[bufnr].modified = false
                else
                    diff.set_ref_text(
                        bufnr,
                        table.concat(state.original, "\n")
                    )
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, state.disk)
                    if not is_overlay_enabled(bufnr) then
                        diff.toggle_overlay(bufnr)
                    end
                    state.showing_disk = true
                    vim.bo[bufnr].modified = true
                end
            end

            vim.api.nvim_create_autocmd({
                "FocusGained",
                "BufEnter",
                "CursorHold",
                "CursorHoldI",
            }, {
                callback = function()
                    if vim.fn.mode() ~= "c" then
                        vim.cmd("checktime")
                    end
                end,
            })

            vim.api.nvim_create_autocmd("FileChangedShell", {
                callback = function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    save_buffer_state(bufnr)
                    toggle_disk_view(bufnr)
                    vim.notify(
                        "File changed on disk. <leader>dl to toggle view, <leader>dr to accept",
                        vim.log.levels.INFO
                    )
                    vim.v.fcs_choice = ""
                end,
            })

            vim.keymap.set("n", "<leader>dl", function()
                local bufnr = vim.api.nvim_get_current_buf()
                if not saved_state[bufnr] then
                    save_buffer_state(bufnr)
                end
                toggle_disk_view(bufnr)
            end, { desc = "Toggle disk view" })

            vim.keymap.set("n", "<leader>dr", function()
                local bufnr = vim.api.nvim_get_current_buf()
                if is_overlay_enabled(bufnr) then
                    diff.toggle_overlay(bufnr)
                end
                vim.cmd("edit!")
                saved_state[bufnr] = nil
                vim.notify("File reloaded from disk", vim.log.levels.INFO)
            end, { desc = "Reload file from disk" })
        end,
    },
}
