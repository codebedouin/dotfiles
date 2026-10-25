return {
  "saghen/blink.cmp",
  version = "1.*",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
  opts_extend = { "sources.default" },
  opts = {
    keymap = {
      preset = "default",
      ["<C-n>"] = { "show", "select_next" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        "snippet_forward",
        function(cmp)
          if cmp.is_menu_visible() then
            return false
          end
          return vim.lsp.inline_completion.get()
        end,
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      menu = { border = "rounded" },
    },
    cmdline = {
      keymap = { preset = "cmdline" },
      completion = { menu = { auto_show = true } },
    },
    signature = { enabled = false },
  },
}
