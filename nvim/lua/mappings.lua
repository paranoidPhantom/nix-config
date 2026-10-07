require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', '<Leader>a', ':Recompile<CR>')
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code actions" })
