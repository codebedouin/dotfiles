return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    preview = {
      filetypes = { "markdown", "quarto", "rmd", "typst", "asciidoc", "codecompanion" },
      ignore_buftypes = {},
    },
  },
}
