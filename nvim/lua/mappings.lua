require "nvchad.mappings"

local map = vim.keymap.set
local wk = require "which-key"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

wk.add {
  { "<leader>a", "<cmd>Recompile<CR>", desc = "Recompile", icon = { icon = "\u{f021}", color = "orange" } },

  { "<leader>c", group = "Code", icon = { icon = "\u{f121}", color = "cyan" } },
  {
    "<leader>ca",
    "<cmd>RustLsp codeAction<CR>",
    desc = "Code actions",
    icon = { icon = "\u{f0eb}", color = "yellow" },
  },
  {
    "<leader>cc",
    "<cmd>RustLsp renderDiagnostic<CR>",
    desc = "Render diagnostic",
    icon = { icon = "\u{f188}", color = "red" },
  },
  {
    "<leader>cd",
    "<cmd>RustLsp openDocs<CR>",
    desc = "Open docs",
    icon = { icon = "\u{f02d}", color = "blue" },
  },
}
