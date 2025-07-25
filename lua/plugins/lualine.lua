local colors = {
	base = "#232136",
	overlay = "#393552",
	white = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	lightGold = "#f7d3a1",
	rose = "#ea9a97",
	pine = "#3e8fb0",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	salmon = "#c5b9c1",
}

local rosePine = {
	normal = {
		a = { fg = colors.base, bg = colors.pine },
		b = { fg = colors.white, bg = colors.overlay },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.base, bg = colors.iris } },

	visual = { a = { fg = colors.base, bg = colors.gold } },

	replace = { a = { fg = colors.base, bg = colors.love } },

	inactive = {
		a = { fg = colors.pine, bg = colors.base },
		b = { fg = colors.foam, bg = colors.base },
		c = { fg = colors.gold },
	},
}

local separators = { left = "", right = "" }

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = rosePine,
			component_separators = " ",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", separator = separators, right_padding = 2 } },
			lualine_b = { { "filename", separator = separators }, { "branch", separator = separators } },
			lualine_c = {
				"%=",
				"buffers" --[[ add your center components here in place of this comment ]],
			},
			lualine_x = { "lsp_status" },
			lualine_y = { "filetype", "progress" },
			lualine_z = {
				{ "location", separator = separators, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { { "filename", separator = separators, right_padding = 2 } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {
			"oil",
			"toggleterm",
		},
	},
}
