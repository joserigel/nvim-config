local builtin = require('telescope.builtin')

vim.keymap.set('n',
  '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n',
  '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n',
  '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n',
  '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local api = require("nvim-tree.api")

vim.keymap.set('n',
  '<leader>e', api.tree.open, { desc = 'Open NvimTree' })
vim.keymap.set('n',
  '<c-z>', 'u', { noremap = true,  silent = true}
)


local lsp_signature = require("lsp_signature")
vim.keymap.set('i', 
  '<c-e>', function() lsp_signature.toggle_float_win() end, { desc = "LSP Signature Toggle" })

local snacks = require("snacks")
vim.keymap.set('t',
  '<c-_>', function() snacks.terminal.toggle() end, { desc = "Toggle Terminal" })
