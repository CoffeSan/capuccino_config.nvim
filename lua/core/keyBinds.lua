-- Define local variables for keymap and command functions
local keymap = vim.keymap
local cmd = vim.cmd

--- Neo Vim Binds
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })  -- Map Space to No operation (Nop) in normal and visual mode
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })  -- Map k to gk or k based on count in normal mode
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })  -- Map j to gj or j based on count in normal mode

--- Save and Close Binds
keymap.set('n', '<C-s>', cmd.wall, { desc = 'Save Current File' })  -- Map Ctrl + S to save the current file
keymap.set('n', '<C-Q>', cmd.bd)  -- Map Ctrl + Q to close the current buffer

--- Buffer Navigation Binds
keymap.set('n', '<C-N>', ':bnext<CR>')  -- Map Ctrl + N to go to the next open buffer
keymap.set('n', '<C-P>', ':bprev<CR>')  -- Map Ctrl + P to go to the previous open buffer

--- Terminal Mode Bind
keymap.set('t', '<C-X>', "<C-\\><C-n><C-w>h")  -- Map Ctrl + X to move cursor to the split window on the left

--- Move Line Binds
keymap.set('n', '<A-j>', ':m +1<CR>')  -- Map Alt + j to move the current line down
keymap.set('n', '<A-k>', ':m -2<CR>')  -- Map Alt + k to move the current line up

--- Harpoon Binds
local harpoon = require("harpoon")
keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = 'Append to buffers list' })  -- Map leader + a to append buffer to the Harpoon list
keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Show buffers list' })  -- Map Ctrl + E to toggle quick menu for Harpoon list
keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = 'Go to first buffer' })  -- Map Alt + 1 to go to the first buffer in the Harpoon list
keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = 'Go to second buffer' })  -- Map Alt + 2 to go to the second buffer in the Harpoon list
keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = 'Go to third buffer' })  -- Map Alt + 3 to go to the third buffer in the Harpoon list
keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = 'Go to fourth buffer' })  -- Map Alt + 4 to go to the fourth buffer in the Harpoon list

--- Toggle Buffers Binds
keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = 'Previous buffer' })  -- Map Ctrl + Shift + P to go to the previous buffer in the Harpoon list
keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = 'Next buffer' })  -- Map Ctrl + Shift + N to go to the next buffer in the Harpoon list

--- cmp Binds
local cmp = require("cmp")
cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),  -- Map Ctrl + K to select the previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(),  -- Map Ctrl + J to select the next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),      -- Map Ctrl + B to scroll documentation up
    ["<C-f>"] = cmp.mapping.scroll_docs(4),       -- Map Ctrl + F to scroll documentation down
    ["<C-Space>"] = cmp.mapping.complete(),       -- Map Ctrl + Space to show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),              -- Map Ctrl + E to close the completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),  -- Map Enter to confirm without selecting
})

--- oil Bind
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })  -- Map - to open the parent directory using Oil

--- Telescope Binds
local telescope = require('telescope.builtin')
keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find File' })  -- Map leader + ff to find files using Telescope
keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Find With Grep' })  -- Map leader + fg to live grep using Telescope
keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find Open Buffer' })  -- Map leader + fb to find open buffers using Telescope

--- Lsp config Binds
local lspBuf = vim.lsp.buf
local diagnostics = vim.diagnostic
local opts = { noremap = true, silent = true }

--- LSP References and Formatting Binds
opts.desc = "Show LSP references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)  -- Map gR to show LSP references using Telescope

opts.desc = "Format current file"
keymap.set("n", "F", lspBuf.format, opts)  -- Map F to format the current file using LSP

--- LSP Navigation Binds
opts.desc = "Go to declaration"
keymap.set("n", "gD", lspBuf.declaration, opts)  -- Map gD to go to declaration using LSP

opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)  -- Map gd to show LSP definitions using Telescope

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)  -- Map gi to show LSP implementations using Telescope

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)  -- Map gt to show LSP type definitions using Telescope

--- LSP Code Actions Binds
opts.desc = "See available code"