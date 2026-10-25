return {
  "olimorris/codecompanion.nvim",
  version = "^20.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCmd" },
  keys = {
    {
      "<leader>ac",
      "<cmd>CodeCompanionChat Toggle<cr>",
      mode = { "n", "v" },
      desc = "AI [c]hat toggle",
    },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI [a]ctions" },
  },
  opts = {
    interactions = {
      inline = {
        adapter = "copilot",
      },
    },
  },
}
