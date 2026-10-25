return {
  "monaqa/dial.nvim",
  keys = {
    { "<C-a>", "<Plug>(dial-increment)", mode = { "n", "x" }, desc = "Increment" },
    { "<C-x>", "<Plug>(dial-decrement)", mode = { "n", "x" }, desc = "Decrement" },
    { "g<C-a>", "<Plug>(dial-g-increment)", mode = { "n", "x" }, desc = "Increment progressively" },
    { "g<C-x>", "<Plug>(dial-g-decrement)", mode = { "n", "x" }, desc = "Decrement progressively" },
  },
  config = function()
    local augend = require("dial.augend")
    local augends = require("dial.config").augends

    local decimal = augend.integer.alias.decimal
    local bool = augend.constant.alias.bool

    local logical = augend.constant.new({
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    })

    local ordinal_numbers = augend.constant.new({
      elements = {
        "first",
        "second",
        "third",
        "fourth",
        "fifth",
        "sixth",
        "seventh",
        "eighth",
        "ninth",
        "tenth",
      },
      word = false,
      cyclic = true,
    })

    local months = augend.constant.new({
      elements = {
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      },
      word = true,
      cyclic = true,
    })

    local base = {
      decimal,
      augend.integer.alias.hex,
      augend.date.alias["%Y/%m/%d"],
      ordinal_numbers,
      augend.constant.alias.en_weekday_full,
      months,
    }

    local function with_base(extra)
      return vim.list_extend(extra, base)
    end

    local typescript = function()
      return with_base({
        bool,
        logical,
        augend.constant.new({ elements = { "let", "const" } }),
      })
    end

    local css = function()
      return with_base({
        augend.hexcolor.new({ case = "lower" }),
        augend.hexcolor.new({ case = "upper" }),
      })
    end

    augends:register_group({ default = base })

    augends:on_filetype({
      css = css(),
      sass = css(),
      scss = css(),
      javascript = typescript(),
      javascriptreact = typescript(),
      typescript = typescript(),
      typescriptreact = typescript(),
      json = with_base({ augend.semver.alias.semver }),
      lua = with_base({
        bool,
        augend.constant.new({
          elements = { "and", "or" },
          word = true,
          cyclic = true,
        }),
      }),
      markdown = with_base({ augend.misc.alias.markdown_header }),
      python = with_base({ augend.constant.alias.Bool, logical }),
      yaml = with_base({ bool }),
    })
  end,
}
