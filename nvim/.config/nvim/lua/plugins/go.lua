return {
  "ray-x/go.nvim",
  ft = { "go", "gomod" },
  dependencies = { "ray-x/guihua.lua" },
  opts = {
    lsp_cfg = false,
    lsp_keymaps = false,
    lsp_document_formatting = false,
    lsp_inlay_hints = { enable = false },
  },
  build = ':lua require("go.install").update_all_sync()',
}
