--local action_set = require('telescope.actions.set')

local M = {}

function M.search_dotfiles()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim",
		hidden = true,
	})
end

return M
