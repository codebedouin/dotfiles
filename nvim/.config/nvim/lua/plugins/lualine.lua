return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "branch", icon = "" }, "diff" },
      lualine_c = {},
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          symbols = { error = " ", warn = " ", info = " " },
        },
      },
      lualine_y = { "progress", "location" },
      lualine_z = { "filename" },
    },
    inactive_sections = {
      lualine_a = { "mode" },
      lualine_b = { { "branch", icon = "" }, "diff" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "filename" },
    },
  },
}
