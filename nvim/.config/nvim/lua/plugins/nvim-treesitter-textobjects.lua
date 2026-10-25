return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  event = "VeryLazy",
  init = function()
    vim.g.no_python_maps = true
  end,
  opts = {
    select = { lookahead = true },
  },
  config = function(_, opts)
    require("nvim-treesitter-textobjects").setup(opts)

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")

    local objects = {
      f = "function",
      c = "class",
      a = "parameter",
      i = "conditional",
      l = "loop",
    }
    for key, name in pairs(objects) do
      vim.keymap.set({ "x", "o" }, "a" .. key, function()
        select.select_textobject("@" .. name .. ".outer", "textobjects")
      end, { desc = "Around " .. name })
      vim.keymap.set({ "x", "o" }, "i" .. key, function()
        select.select_textobject("@" .. name .. ".inner", "textobjects")
      end, { desc = "Inside " .. name })
    end

    local moves = {
      { "]m", "goto_next_start", "@function.outer", "Next function start" },
      { "[m", "goto_previous_start", "@function.outer", "Previous function start" },
      { "]k", "goto_next_start", "@class.outer", "Next class start" },
      { "[k", "goto_previous_start", "@class.outer", "Previous class start" },
    }
    for _, m in ipairs(moves) do
      vim.keymap.set({ "n", "x", "o" }, m[1], function()
        move[m[2]](m[3], "textobjects")
      end, { desc = m[4] })
    end
  end,
}
