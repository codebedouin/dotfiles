return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		{
			preview = {
				filetypes = { "markdown", "quarto", "rmd", "copilot-chat", "codecompanion" },
				ignore_buftypes = {},
				condition = function(buffer)
					local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt

					if bt == "nofile" and ft == "codecompanion" then
						return true
					elseif bt == "nofile" then
						return false
					else
						return true
					end
				end,
			},
		},
	},
}
