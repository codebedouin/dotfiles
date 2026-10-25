return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup()

    local attempted = {}
    local available

    local function is_available(lang)
      if not available then
        available = {}
        for _, name in ipairs(ts.get_available()) do
          available[name] = true
        end
      end
      return available[lang] == true
    end

    local function enable(buf, lang)
      if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.treesitter.start, buf, lang)
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_auto_install", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end
        if vim.treesitter.language.add(lang) then
          enable(args.buf, lang)
          return
        end
        if attempted[lang] or vim.fn.executable("tree-sitter") ~= 1 or not is_available(lang) then
          return
        end
        attempted[lang] = true
        ts.install(lang):await(function(err, ok)
          if err or not ok then
            return
          end
          vim.schedule(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.bo[buf].filetype == args.match then
                enable(buf, lang)
              end
            end
          end)
        end)
      end,
    })

    if vim.fn.executable("tree-sitter") == 1 then
      ts.install({ "yaml", "regex", "bash" })
    end
  end,
}
