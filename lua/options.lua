-- Disable netrw to prevent conflicts with the nvim-tree plugin --
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Shows the line numbers and relative line numbers --
vim.opt.number = true
vim.opt.relativenumber = true

-- Shows new windows from splits at the bottom and right instead of top and left --
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable line wrap --
vim.opt.wrap = false

-- Sets tab-width to 4 and expands tabs with spaces --
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Enable virtual edit mode in block view mode --
vim.opt.virtualedit = "block"

-- Uses the system clipborad --
vim.opt.clipboard = "unnamedplus"

-- Scrolls page when cursor is in the middle of the screen --
vim.opt.scrolloff = 999

-- Show change preview in split window --
vim.opt.inccommand = "split"

-- Ignores casing in vim commands --
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

-- Map (Shift + ) "Tab" to switch to the Next (previous) buffer
-- Map <Leader>w to close the current buffer and open the previous one if available
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>w", function()
    local bufnr = vim.api.nvim_get_current_buf() -- Get current buffer

    vim.cmd("bnext") -- Switch to next buffer
    vim.cmd("bd " .. bufnr) -- Delete the original buffer
end, { noremap = true, silent = true })
