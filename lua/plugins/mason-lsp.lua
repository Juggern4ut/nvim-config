return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim"},
    config = function()
        require("mason-lspconfig").setup({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,
        })
    end,
}
