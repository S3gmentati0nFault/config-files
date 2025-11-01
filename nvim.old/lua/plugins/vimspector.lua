return {
	{ -- Autoformat
		"puremourning/vimspector",
		config = function()
			-- Normal mode mappings
			vim.api.nvim_set_keymap("n", "<Leader>1", "<Plug>VimspectorContinue", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>2", "<Plug>VimspectorStop", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>3", "<Plug>VimspectorRestart", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>4", "<Plug>VimspectorPause", { noremap = false, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>5",
				"<Plug>VimspectorToggleBreakpoint",
				{ noremap = false, silent = true }
			)
			vim.api.nvim_set_keymap("n", "<Leader>6", "<Plug>VimspectorStepOver", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>7", "<Plug>VimspectorStepInto", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>8", "<Plug>VimspectorStepOut", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>9", "<Plug>VimspectorRunToCursor", { noremap = false, silent = true })

			-- BalloonEval (normal + visual mode)
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>di",
				"<Plug>VimspectorBalloonEval",
				{ noremap = false, silent = true }
			)
			vim.api.nvim_set_keymap(
				"x",
				"<Leader>di",
				"<Plug>VimspectorBalloonEval",
				{ noremap = false, silent = true }
			)
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
