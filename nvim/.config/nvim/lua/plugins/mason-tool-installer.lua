return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    ensure_installed = {
      "stylua",
      "eslint_d",
      "prettier",
      "ruff",
      "goimports",
      "gofumpt",
    },
    run_on_start = false,
  },
  config = function(_, opts)
    local installer = require("mason-tool-installer")
    installer.setup(opts)
    installer.check_install(false)
  end,
}
