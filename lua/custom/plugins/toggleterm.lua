return {

	'akinsho/toggleterm.nvim',
	version = "*",
	keys = [[<C-\>]],
	opts = {
		open_mapping = [[<C-\>]],
		size = 14,
		hide_numbers = true,
		shell = vim.o.shell,
		shade_terminals = true,
		shading_factor = 2,
		persist_size = true,
		start_in_insert = true,
		close_on_exit = true,
		direction = "horizontal",
		float_opts = { border = 'curved' },

	},


}
