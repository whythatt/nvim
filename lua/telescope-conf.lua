local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

local actions = require("telescope.actions")
require("nvim-web-devicons").setup({
	override = {},
	default = true,
})
require("telescope").setup({
	defaults = {
		-- path_display = {'smart'},
		mappings = {
			i = {
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
				["<esc>"] = actions.close,
			},
		},
	},
	--   layout_config = {
	--     horizontal = {
	--       preview_cutoff = 100,
	--       preview_width = 0.6,
	--     }
	--   }
})
