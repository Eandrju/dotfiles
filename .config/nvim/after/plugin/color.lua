vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"
--vim.cmd("colorscheme tokyonight")

vim.g.gruvbox_contrast_dard = 'dark'
vim.cmd("colorscheme gruvbox")

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { ctermbg=NONE,  guibg=NONE})

