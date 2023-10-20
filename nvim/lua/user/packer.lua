-- Install packer
local install_path = ' ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end


return require('packer').startup(function(use)
	 use 'wbthomason/packer.nvim'

       use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use 'navarasu/onedark.nvim'
    use 'nvim-lualine/lualine.nvim'
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'onedark',
            component_separators = '|',
            section_separators = ' ',
        }
    }

    use {"windwp/nvim-autopairs"}

	use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('fatih/vim-go')

	use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
	    -- LSP Support
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},
	    {'neovim/nvim-lspconfig'},

	    -- Autocompletion
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-nvim-lua'},
	    {'hrsh7th/cmp-path'},
	    {'hrsh7th/nvim-cmp'},
	    {'saadparwaiz1/cmp_luasnip'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
      }
    }
      use('EdenEast/nightfox.nvim')
      use {
	      'nvim-tree/nvim-tree.lua',
	      requires = {
		      'nvim-tree/nvim-web-devicons', -- optional, for file icons
	      },
	      tag = 'nightly' -- optional, updated every week. (see issue #1193)
      }
end)
