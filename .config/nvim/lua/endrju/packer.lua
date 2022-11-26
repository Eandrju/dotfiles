return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- General
    use 'terrortylor/nvim-comment'
    use 'rstacruz/vim-closer'
    use 'EinfachToll/DidYouMean'

    -- Treesiter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-treesitter/playground'

    -- Colorschemes
    -- use 'folke/tokyonight.nvim'
    use 'ellisonleao/gruvbox.nvim'

    -- Icons and fonts
    use "kyazdani42/nvim-web-devicons"
    -- if is_linux then
    -- use "yamatsum/nvim-web-nonicons"
    -- end

    -- Greeting
    use "goolord/alpha-nvim"

    -- Git shiet
    use 'tpope/vim-fugitive'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
   -- use 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

   --  Local
    use '/Users/alfierra/projects/serotonin.nvim'

    --  autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim' -- snip formatting

    -- Mason manages external LSPs, linters, DAPs
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- Rust
    use 'simrat39/rust-tools.nvim'

    -- Lua
    use "folke/neodev.nvim" -- Neovim setup for init.lua and plugin development

    -- Tmux 
    use {
        "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end
    }


end)
