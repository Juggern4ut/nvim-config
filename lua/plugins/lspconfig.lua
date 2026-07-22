return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        vim.lsp.config("*", { capabilities = capabilities })

        -- Vue (and Nuxt) SFCs are handled in "hybrid mode": vue_ls only takes
        -- care of the template/CSS blocks, while vtsls (with the
        -- @vue/typescript-plugin) provides TS/JS intellisense inside <script>.
        -- See https://github.com/vuejs/language-tools/wiki/Neovim
        local vue_language_server_path = vim.fn.stdpath("data")
            .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

        vim.lsp.config("vtsls", {
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
            },
            settings = {
                vtsls = {
                    tsserver = {
                        globalPlugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = vue_language_server_path,
                                languages = { "vue" },
                                configNamespace = "typescript",
                            },
                        },
                    },
                },
            },
        })

        vim.lsp.enable({ "lua_ls", "vue_ls", "vtsls", "cssls", "eslint" })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local opts = { buffer = event.buf, noremap = true, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })
    end,
}
