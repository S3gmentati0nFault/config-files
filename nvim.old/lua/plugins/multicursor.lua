return {
	{
		"brenton-leighton/multiple-cursors.nvim",
		version = "*", -- Use the latest tagged version
		opts = {
			custom_key_maps = {
				{
					"n",
					"<Leader>|",
					function()
						require("multiple-cursors").align()
					end,
				},
			},
		},
		keys = {
			{
				"<C-S-Up>",
				"<Cmd>MultipleCursorsAddUp<CR>",
				mode = { "n", "i", "x" },
				desc = "Add cursor and move up",
			},
			{
				"<C-S-Down>",
				"<Cmd>MultipleCursorsAddDown<CR>",
				mode = { "n", "i", "x" },
				desc = "Add cursor and move down",
			},
			{
				"<C-d>",
				"<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
				mode = { "n", "x" },
				desc = "Add cursor and jump to next cword",
			},
			{
				"<leader>l",
				"<Cmd>MultipleCursorsAddMatches<CR>",
				mode = { "n", "x" },
				desc = "Add cursors to cword",
			},
		},
	},
}
