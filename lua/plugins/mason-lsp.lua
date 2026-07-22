return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "vue_ls",
                "vtsls",
                "cssls",
                "eslint",
            },
            -- Server setup (capabilities, the vue_ls/vtsls hybrid-mode wiring, etc.)
            -- is handled explicitly in plugins/lspconfig.lua, so it doesn't race
            -- with mason installing the servers.
            automatic_enable = false,
        })
    end,
}
