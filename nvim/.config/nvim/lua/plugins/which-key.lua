return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>s", group = "search" },
      { "<leader>g", group = "git" },
      { "<leader>x", group = "diagnostics" },
      { "<leader>c", group = "code" },
      { "<leader>a", group = "AI" },
      { "<leader>w", group = "workspace" },
    },
  },
}
