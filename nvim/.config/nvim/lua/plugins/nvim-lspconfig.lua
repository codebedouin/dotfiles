return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "mason-org/mason.nvim",
      cmd = "Mason",
      opts = {},
      keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Open mason" } },
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "jsonls",
          "html",
          "cssls",
          "bashls",
          "pyright",
          "tailwindcss",
          "svelte",
          "gopls",
          "copilot",
        },
        automatic_enable = { exclude = { "stylua", "ruff" } },
      },
    },
    "saghen/blink.cmp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
          return
        end

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buf = ev.buf, desc = desc })
        end

        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "<C-k>", vim.lsp.buf.signature_help, "Show signature help")
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace add folder")
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace remove folder")
        map("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "Workspace list folders")

        if client:supports_method("textDocument/inlayHint", ev.buf) then
          map("n", "<leader>ch", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }),
              { bufnr = ev.buf }
            )
          end, "Toggle inlay hints")
        end

        if client:supports_method("textDocument/inlineCompletion", ev.buf) then
          vim.lsp.inline_completion.enable(true, { bufnr = ev.buf })
          map("i", "<M-n>", function()
            vim.lsp.inline_completion.select({ count = 1 })
          end, "Next inline completion")
          map("i", "<M-p>", function()
            vim.lsp.inline_completion.select({ count = -1 })
          end, "Previous inline completion")
        end
      end,
    })
  end,
}
