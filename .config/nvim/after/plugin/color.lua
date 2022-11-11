-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
-- vim.opt.background = "dark"
-- vim.cmd("colorscheme tokyonight")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { ctermbg=NONE,  guibg=NONE})

