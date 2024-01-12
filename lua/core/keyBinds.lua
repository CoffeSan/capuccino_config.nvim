-- Define local variables for keymap and command functions
local keymap = vim.keymap
local cmd = vim.cmd

-- Neo Vim Binds
-- Map Space to No operation (Nop) in normal and visual mode
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Map k to gk or k based on count in normal mode
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- Map j to gj or j based on count in normal mode
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Save and Close Binds
-- Map Ctrl + S to save the current file
keymap.set('n', '<C-s>', cmd.wall, { desc = 'Save Current File' })
-- Map Ctrl + Q to close the current buffer
keymap.set('n', '<C-Q>', cmd.bd)

-- Buffer Navigation Binds
-- Map Ctrl + N to go to the next open buffer
keymap.set('n', '<C-N>', ':bnext<CR>')
-- Map Ctrl + P to go to the previous open buffer
keymap.set('n', '<C-P>', ':bprev<CR>')

-- Terminal Mode Bind
-- Map Ctrl + X to move cursor to the split window on the left
keymap.set('t', '<C-X>', "<C-\\><C-n><C-w>h")

-- Move Line Binds
-- Map Alt + j to move the current line down
keymap.set('n', '<A-j>', ':m +1<CR>')
-- Map Alt + k to move the current line up
keymap.set('n', '<A-k>', ':m -2<CR>')
-- Move line down in visual mode
keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
-- Move line up in visual mode
keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Harpoon Binds
local harpoon = require("harpoon")
-- Map leader + a to append buffer to the Harpoon list
keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = 'Append to buffers list' })
-- Map Ctrl + E to toggle quick menu for Harpoon list
keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Show buffers list' })
-- Map Alt + 1 to go to the first buffer in the Harpoon list
keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = 'Go to first buffer' })
-- Map Alt + 2 to go to the second buffer in the Harpoon list
keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = 'Go to second buffer' })
-- Map Alt + 3 to go to the third buffer in the Harpoon list
keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = 'Go to third buffer' })
-- Map Alt + 4 to go to the fourth buffer in the Harpoon list
keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = 'Go to fourth buffer' })

-- Toggle Buffers Binds
-- Map Ctrl + Shift + P to go to the previous buffer in the Harpoon list
keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = 'Previous buffer' })
-- Map Ctrl + Shift + N to go to the next buffer in the Harpoon list
keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = 'Next buffer' })

-- oil Bind
-- Map - to open the parent directory using Oil
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope Binds
local telescope = require('telescope.builtin')
-- Map leader + ff to find files using Telescope
keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find File' })
-- Map leader + fg to live grep using Telescope
keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Find With Grep' })
-- Map leader + fb to find open buffers using Telescope
keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find Open Buffer' })

-- Trouble Binds
local trouble = require("trouble")
-- Toggle the Trouble plugin
keymap.set("n", "<leader>xx", function() trouble.toggle() end)
-- Toggle workspace diagnostics in Trouble
keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end)
-- Toggle document diagnostics in Trouble
keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end)
-- Toggle quickfix in Trouble
keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end)
-- Toggle location list in Trouble
keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end)
-- Toggle LSP references in Trouble
keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)

-- Lsp config Binds
local lspBuf = vim.lsp.buf
local diagnostics = vim.diagnostic
local opts = { noremap = true, silent = true }

-- LSP References and Formatting Binds
-- Map gR to show LSP references using Telescope
opts.desc = "Show LSP references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

-- Map F to format the current file using LSP
opts.desc = "Format current file"
keymap.set("n", "F", lspBuf.format, opts)

-- LSP Navigation Binds
-- Map gD to go to declaration using LSP
opts.desc = "Go to declaration"
keymap.set("n", "gD", lspBuf.declaration, opts)

-- Map gd to show LSP definitions using Telescope
opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

-- Map gi to show LSP implementations using Telescope
opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

-- Map gt to show LSP type definitions using Telescope
opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

-- LSP Code Actions Binds
-- Map leader + ca to see available code actions using LSP
opts.desc = "See available code actions"
keymap.set({ "n", "v" }, "<leader>ca", lspBuf.code_action, opts)

-- LSP Rename and Diagnostics Binds
-- Map leader + rn to perform a smart rename using LSP
opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", lspBuf.rename, opts)

-- Map leader + D to show buffer diagnostics using Telescope
opts.desc = "Show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

-- Map leader + d to show line diagnostics using Vim's diagnostics
opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>d", diagnostics.open_float, opts)

-- LSP Diagnostic Navigation Binds
-- Map [d to go to the previous diagnostic
opts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", diagnostics.goto_prev, opts)

-- Map ]d to go to the next diagnostic
opts.desc = "Go to next diagnostic"
keymap.set("n", "]d", diagnostics.goto_next, opts)

-- LSP Hover and Restart Binds
-- Map K to show documentation for what is under the cursor using LSP
opts.desc = "Show documentation for what is under cursor"
keymap.set("n", "K", lspBuf.hover, opts)

-- Map leader + rs to restart LSP
opts.desc = "Restart LSP"
keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
