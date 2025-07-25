return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "secondBrain",
				path = "~/Documents/secondBrain",
			},
		},
	},
	ui = { enable = false },
}
