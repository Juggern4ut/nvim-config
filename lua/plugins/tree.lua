-- Configures the nvim-tree plugin which enables the file browser
return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
        })
    end
}
