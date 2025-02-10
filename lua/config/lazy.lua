local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
        import = "plugins"
    },
    {
        "catppuccin/nvim",
        priority = 1000,
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "airblade/vim-gitgutter"
    },
    {
        "akinsho/toggleterm.nvim",
        opts = {}
    },
    {
        "mg979/vim-visual-multi"
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "rabamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd.colorscheme("catppuccin-mocha")
