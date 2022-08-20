return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'rstacruz/vim-closer'

  -- colorschemes
  use 'folke/tokyonight.nvim'
  use 'gruvbox-community/gruvbox'

  -- Git shiet
  use 'tpope/vim-fugitive'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
--  use 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

end)
