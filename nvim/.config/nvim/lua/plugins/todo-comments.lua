return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TodoTelescope", "TodoTrouble", "TodoQuickFix", "TodoLocList" },
  opts = {},
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next [t]odo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous [t]odo comment",
    },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search [t]odos" },
  },
}
