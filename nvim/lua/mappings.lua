require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', '<Leader>a', ':Recompile<CR>')
map('n', '<leader>ca', ':RustLsp codeAction<CR>', { desc = "LSP Code actions" })
map('n', '<space>cc', ':RustLsp renderDiagnostic<CR>', { desc = "LSP Render Diagnostic" } )
map('n', '<space>cd', ':RustLsp openDocs<CR>', { desc = "LSP Open Docs" } )
