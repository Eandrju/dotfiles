return require('packer').startup(function()
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

    -- colorschemes
    -- use 'folke/tokyonight.nvim'
    -- use 'gruvbox-community/gruvbox'
    use 'ellisonleao/gruvbox.nvim'
    -- use 'luisiacc/gruvbox-baby'

    -- Git shiet
    use 'tpope/vim-fugitive'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
   -- use 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    --  LSP autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Mason manages external LSPs, linters, DAPs
    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- Rust
    use 'simrat39/rust-tools.nvim'


end)
