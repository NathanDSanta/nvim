return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<C-Left>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<C-Down>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<C-Up>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<C-Right>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
