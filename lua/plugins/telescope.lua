return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		'nvim-telescope/telescope-ui-select.nvim',
	},
	opts = {
		extensions = {
			noice = {},
			fzf = {},
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	},
}
