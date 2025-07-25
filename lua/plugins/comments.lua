return {
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			signs = false,
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			toggler = {
				line = "gc",
				block = "gb",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				above = "gO",
				below = "go",
				eol = "gA",
			},
		},
	},
}
