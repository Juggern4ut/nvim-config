return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                separator_style = "slant",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text_align = "left",
                        separator = true,
                    },
                },
            }
        })
    end
}
