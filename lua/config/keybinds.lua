vim.g.mapleader = " "
vim.g.localleader = "\\"

-- Movement
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "Move current line up" })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "Move current line down" })
vim.keymap.set("v", "<M-K>", ":m '<-2<CR>gv=gv", { desc = "Move current line up" })
vim.keymap.set("v", "<M-J>", ":m '>+1<CR>gv=gv", { desc = "Move current line down" })

vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Focus Up" })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Focus Down" })
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Focus Left" })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Focus Right" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centered when moving up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centerd when moving down" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Keep cursor centered when going to the next searched value" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor centered when going to the prev searched value" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Keep cursor in place when using J" })

-- Deleting, copying and Pasting
vim.keymap.set("n", "x", '"_x', { desc = "Do not copy when deleting a single character with x" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Keep the copied value when pasting over another word" })

-- Quick Fix navigation
-- vim.keymap.set("n", "<C-Down>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-Up>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader><Down>", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader><Up>", "<cmd>lprev<CR>zz")

--         _                   _             _  __          _     _           _
--        | |    ___  __ _  __| | ___ _ __  | |/ /___ _   _| |__ (_)_ __   __| |___
--        | |   / _ \/ _` |/ _` |/ _ \ '__| | ' // _ \ | | | '_ \| | '_ \ / _` / __|
--        | |__|  __/ (_| | (_| |  __/ |    | . \  __/ |_| | |_) | | | | | (_| \__ \
--        |_____\___|\__,_|\__,_|\___|_|    |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
--                                                    |___/

--##########
--# DIRECT #
--##########

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })

vim.keymap.set("n", "<C-k>", ":NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

--#############
--# TELESCOPE #
--#############

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>tq", builtin.quickfix, { desc = "List items in the quickfix" })
vim.keymap.set("n", "<leader>td", builtin.diagnostics, { desc = "Telescope Diagnostics" })
vim.keymap.set("n", "<leader>tk", builtin.keymaps, { desc = "Telescope Keymaps" })
vim.keymap.set("n", "<leader>tn", ":Telescope noice<CR>", { desc = "Telescope Noice" })
vim.keymap.set("n", "<leader>ts", function()
	builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
end, { desc = "Search in al open files" })
vim.keymap.set("n", "<leader>t/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ winblend = 10, previewer = true }))
end, { desc = "Search in current buffer" })

-- T Group Exception (Muscle Memory already engrained)
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>tt",
-- 	"<cmd>:ToggleTerm direction=float name=NvimTerminal<CR>",
-- 	{ desc = "Toggle Terminal" }
-- )

--#######
--# LSP #     All configurations are OnAttach
--#######

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, "<leader>l" .. keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("R", vim.lsp.buf.rename, "Rename")
		map("ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
		map("r", builtin.lsp_references, "Go to References")
		map("i", builtin.lsp_implementations, "Go to Implementation")
		map("d", builtin.lsp_definitions, "Go to Definition")
		map("D", vim.lsp.buf.declaration, "Go to Declaration")
		map("s", builtin.lsp_document_symbols, "Open document Symbols")
		map("S", builtin.lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
		map("t", builtin.lsp_type_definitions, "Goto type Definition")

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("<leader>lh", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle Inlay Hints")
		end
	end,
})

--#######
--# OIL #
--#######

vim.keymap.set("n", "<leader>oo", ":Oil<CR>", { desc = "Open Oil File Explorer" })
vim.keymap.set("n", "<leader>of", ":Oil --float<CR>", { desc = "Open Oil Float" })

--##########
--# BUFFER #
--##########

vim.keymap.set("n", "<leader>be", ":enew<CR>", { desc = "New Buffer" })
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bc", ":bd<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bs", ":saveas", { desc = "Save Buffer As" })

vim.keymap.set({ "n", "v" }, "<leader>bf", ":BufferFormat<CR>", { desc = "Format buffer" })
