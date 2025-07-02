---@diagnostic disable: undefined-global

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
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<Leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

-- Map (Shift + ) "Tab" to switch to the Next (previous) buffer
-- Map <Leader>w to close the current buffer and open the previous one if available
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>w", function()
    local bufnr = vim.api.nvim_get_current_buf() -- Get current buffer

    vim.cmd("bnext")                             -- Switch to next buffer
    vim.cmd("bd " .. bufnr)                      -- Delete the original buffer
end, { noremap = true, silent = true })

-- Map keybinds to find (in) files
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true })

-- Map keybinds to open and toggle terminals
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tt", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })

-- Map keybinds to allow undoing by pressing U
vim.keymap.set("n", "U", ":redo<CR>", { noremap = true, silent = true });

-- Map keys so that they delete to the black hole register (prevents coping text when deleting or changing)
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "c", '"_c', { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })
vim.keymap.set("v", "x", '"_x', { noremap = true })
vim.keymap.set("v", "c", '"_c', { noremap = true })

-- Map to format the whole buffer
vim.keymap.set("n", "<Leader>fa", vim.lsp.buf.format, { noremap = true, silent = true })

-- Map to show warnings/errors
vim.keymap.set("n", "<Leader>oo", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Map keys to allow saving a buffer when pressing Ctrl+s (in normal aswell as in insert mode)
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })
