vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew' })
vim.keymap.set('n', '<C-s>', vim.cmd.wall, { desc = 'Save Current File' })

vim.keymap.set('n', '<C-Q>', vim.cmd.bd)

vim.keymap.set('n', '<C-N>', ':bnext<CR>')
vim.keymap.set('n', '<C-P>', ':bprev<CR>')

vim.keymap.set('t', '<C-X>', "<C-\\><C-n><C-w>h")