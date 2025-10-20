return {
	{
		"m4xshen/autoclose.nvim",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("autoclose").setup({
				keys = {
					["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
				},
			})
		end,
	},
}
