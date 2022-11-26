local my_tele = require('endrju.telescope')
local builtin_tele = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin_tele.git_files)

vim.keymap.set('n', '<leader>sd', function()
    my_tele.search_dotfiles({ hidden = true })
end)

