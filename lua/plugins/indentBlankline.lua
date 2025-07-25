return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local highlight = {
			"Sky",
			"Foam",
			"Iris",
			"Gold",
			"Love",
			"Pine",
			"Rose",
		}

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Sky", { fg = "#e0def4" })
			vim.api.nvim_set_hl(0, "Iris", { fg = "#c4a7e7" })
			vim.api.nvim_set_hl(0, "Love", { fg = "#eb6f92" })
			vim.api.nvim_set_hl(0, "Gold", { fg = "#f6c177" })
			vim.api.nvim_set_hl(0, "Rose", { fg = "#ea9a97" })
			vim.api.nvim_set_hl(0, "Pine", { fg = "#3e8fb0" })
			vim.api.nvim_set_hl(0, "Foam", { fg = "#9ccfd8" })
		end)

		vim.g.rainbow_delimiters = { highlight = highlight }
		require("ibl").setup({
			scope = { highlight = highlight },
		})
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
