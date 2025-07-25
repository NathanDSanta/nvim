vim.api.nvim_create_user_command("BufferFormat", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { nargs = 0, desc = "Format buffer" })
