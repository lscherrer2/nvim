vim.diagnostic.config({ virtual_text = true })

vim.filetype.add({
    pattern = {
        [".env.*"] = "dotenv",
    },
})
