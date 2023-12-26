local keymap = vim.keymap
local move_line = require('core.utils')

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap.set('n', '<C-s>', vim.cmd.wall, { desc = 'Save Current File' })

keymap.set('n', '<C-Q>', vim.cmd.bd)

keymap.set('n', '<C-N>', ':bnext<CR>')
keymap.set('n', '<C-P>', ':bprev<CR>')

keymap.set('t', '<C-X>', "<C-\\><C-n><C-w>h")

keymap.set('n', '<A-j>', ':m +1<CR>')
keymap.set('n', '<A-k>', ':m -2<CR>')