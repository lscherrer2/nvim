-- Helper: find nearest project root
local function get_project_root(bufnr)
    local root = vim.fs.root(bufnr or 0, {
        ".venv", ".git", "pyproject.toml", "setup.py", "requirements.txt"
    })
    return root or vim.fn.getcwd()
end

-- Helper: detect .venv/python
local function find_venv_python(root)
    local sep = package.config:sub(1, 1)
    local candidates = {
        root .. sep .. ".venv" .. sep .. "bin" .. sep .. "python",
        root .. sep .. ".venv" .. sep .. "Scripts" .. sep .. "python.exe",
    }
    for _, p in ipairs(candidates) do
        if vim.uv.fs_stat(p) then return p end
    end
end

return {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_new_config = function(config, root_dir)
        local root = root_dir or get_project_root()
        local py = find_venv_python(root)
        if py then
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            config.settings.python.pythonPath = py
        else
            -- fallback to default
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            config.settings.python.venvPath = "."
            config.settings.python.venv = ".venv"
        end
    end,
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "standard",
                autoImportCompletions = true,
            },
        },
    },
}
