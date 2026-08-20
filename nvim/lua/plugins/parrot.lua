return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim", "folke/noice.nvim" },
  opts = {},
  config = function()
    require("parrot").setup {
      providers = {
        github_copilot = {
          name = "github_copilot",
          api_key = "dummy", 
          endpoint = "http://localhost:4141/v1/chat/completions",
          params = {
            chat = { temperature = 1.1, top_p = 1 },
            command = { temperature = 1.1, top_p = 1 },
          },
          models = {
            "gemini-3.1-pro-preview",
            "goldeneye-free-auto",
            "minimax-m2.5",
            "grok-code-fast-1",
            "gemini-3-flash-preview",
            "oswe-vscode-prime",
            "oswe-vscode-secondary"
          }
        }
      },
    }
  end,
  lazy=false
}
