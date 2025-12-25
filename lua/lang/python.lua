-- Fix python indenting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "setlocal indentexpr=",
})

-- Add python rulers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt.colorcolumn = "72,79"
  end,
})

-- Ruff fmt on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function(args)
        print("ruff format " .. vim.api.nvim_buf_get_name(args.buf))
        vim.system(
            { "ruff", "format", vim.api.nvim_buf_get_name(args.buf) },
            { text=true }
        ):wait()
        vim.cmd("checktime " .. args.buf)
    end
})
