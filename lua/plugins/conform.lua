return {
    "stevearc/conform.nvim",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    init = function()
        require("mason-tool-installer").setup({
            ensure_installed = { "prettierd" },
        })
    end,
    opts = {
        formatters_by_ft = {
            vue = { "prettierd" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            css = { "prettierd" },
            scss = { "prettierd" },
            html = { "prettierd" },
            json = { "prettierd" },
            yaml = { "prettierd" },
            markdown = { "prettierd" },
        },
        format_on_save = {
            timeout_ms = 2000,
            lsp_format = "fallback",
        },
    },
}
