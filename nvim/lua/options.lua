require "nvchad.options"


local o = vim.o

-- Highlight both the cursor line and its line number.
o.cursorline = true
o.cursorlineopt = "both"

-- Show relative line numbers.
o.number = true
o.relativenumber = true

-- Enable project-local configuration.
-- Neovim prompts before sourcing untrusted project files.
o.exrc = true
