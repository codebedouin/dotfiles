return {
  "catgoose/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    filetypes = { "*" },
    options = {
      parsers = {
        css = true,
        tailwind = { enable = true },
      },
      display = {
        mode = "virtualtext",
      },
    },
  },
}
