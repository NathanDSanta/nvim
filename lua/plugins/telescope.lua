return {
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
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
	},
}
