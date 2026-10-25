return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  cmd = "Telescope",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
    "debugloop/telescope-undo.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search for [f]iles" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search via [g]rep" },
    { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Search for [b]uffers" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search for [h]elp" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search for [k]eymaps" },
    { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Search for [c]ommands" },
    { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Search in [u]ndo tree" },
  },
  opts = {
    pickers = {
      find_files = {
        find_command = function()
          if vim.fn.executable("rg") == 1 then
            return { "rg", "--files", "--color", "never", "--hidden", "-g", "!.git" }
          end
          return { "fd", "--type", "f", "--color", "never", "--hidden", "--exclude", ".git" }
        end,
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("undo")
  end,
}
