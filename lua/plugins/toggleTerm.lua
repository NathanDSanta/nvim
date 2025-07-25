return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "float",
		open_mapping = [[<leader>tt]],
		float_opts = {
			border = "curved",
		},
		on_create = function(term)
			term.name = "Zsh Terminal"
		end,
	},
}
