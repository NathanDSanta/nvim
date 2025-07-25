return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		icons = {
			mappings = true,
		},
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	spec = {
		{ "<leader>l", group = "[L]sp" },
		{ "<leader>t", group = "[T]elescope" },
		{ "<leader>O", group = "[O]il" },
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true, preset = "modern" })
			end,
			desc = "Keymaps",
		},
	},
}
