local keymap = vim.keymap
local cmd = vim.cmd

-- Neo Vim Binds
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Save open buffer
keymap.set('n', '<C-s>', cmd.wall, { desc = 'Save Current File' })
-- Close current open buffer
keymap.set('n', '<C-Q>', cmd.bd)

-- Go to next open buffer
keymap.set('n', '<C-N>', ':bnext<CR>')
-- Go to previous open buffer
keymap.set('n', '<C-P>', ':bprev<CR>')

keymap.set('t', '<C-X>', "<C-\\><C-n><C-w>h")

-- Move line up
keymap.set('n', '<A-j>', ':m +1<CR>')
-- Move line down
keymap.set('n', '<A-k>', ':m -2<CR>')

-- Harpoon Binds
local harpoon = require("harpoon")
keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = 'Append to buffers list' })
keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Show buffers list' })
keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = 'Go to first buffer' })
keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = 'Go to seccond buffer' })
keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = 'Go to third buffer' })
keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = 'Go to fourth buffer' })

-- Toggle previous & next buffers stored within Harpoon list
keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = 'Previous buffer' })
keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = 'Next buffer' })

-- cmp Binds
local cmp = require("cmp")
cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
})


-- oil Bind
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope Binds
local telescope = require('telescope.builtin')
keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find File' })
keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Find With Grep' })
keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find Open Buffer' })

-- Lsp config Binds
local lspBuf = vim.lsp.buf
local diagnostics = vim.diagnostic
local opts = { noremap = true, silent = true }

opts.desc = "Show LSP references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Format current file"
keymap.set("n", "F", lspBuf.format, opts)

opts.desc = "Go to declaration"
keymap.set("n", "gD", lspBuf.declaration, opts)

opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

opts.desc = "See available code actions"
keymap.set({ "n", "v" }, "<leader>ca", lspBuf.code_action, opts)

opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", lspBuf.rename, opts)

opts.desc = "Show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>d", diagnostics.open_float, opts)

opts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", diagnostics.goto_prev, opts)

opts.desc = "Go to next diagnostic"
keymap.set("n", "]d", diagnostics.goto_next, opts)

opts.desc = "Show documentation for what is under cursor"
keymap.set("n", "K", lspBuf.hover, opts)

opts.desc = "Restart LSP"
keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

opts.desc = "Format current buffer"
keymap.set("n", "<C-f>", lspBuf.format, opts)
