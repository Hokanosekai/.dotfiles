-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  vim.notify("Packer does not appear to be installed")
  return
end

local function ui_plugins(use)
  use({ "kyazdani42/nvim-web-devicons" })
  use({ 'nvim-tree/nvim-tree.lua', config = function()
    require('hoka.plugins.nvim-tree')
  end
  })
  use({ "glepnir/lspsaga.nvim", config = function()
    require('hoka.plugins.lspsaga')
  end
  })
  use({ "nvim-lualine/lualine.nvim", config = function()
    require('hoka.plugins.lualine')
  end
  })
  use {
    'goolord/alpha-nvim',
    config = function()
      require('hoka.plugins.alpha')
    end
  }
  use {
    'folke/trouble.nvim',
    config = function()
      require('hoka.plugins.trouble')
    end
  }
end

local function tools_plugins(use)
  use({ 'windwp/nvim-autopairs', config = function()
    require('hoka.plugins.autopairs')
  end
  })

  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = function()
      require('hoka.plugins.comment')
    end
  }

  use({ 'andweeb/presence.nvim', config = function()
    require('hoka.plugins.presence')
  end
  })

  use("github/copilot.vim")

  use({ "nvim-lua/plenary.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim",
    requires = { 'nvim-telescope/telescope-file-browser.nvim' },
    config = function()
      require('hoka.plugins.telescope')
    end
  })
  use({ 'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end
  })

  use({ 'folke/zen-mode.nvim', config = function()
    require('hoka.plugins.zen-mode')
  end
  })
  use({ "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    config = function()
      require('hoka.plugins.luasnip')
    end
  })
  use({ "saadparwaiz1/cmp_luasnip" })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require('hoka.plugins.treesitter')
    end
  }
  use({ 'mg979/vim-visual-multi' })

  use({ "ahmedkhalf/project.nvim", config = function()
    require('hoka.plugins.project')
  end
  })
end

local function lsp_plugins(use)
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim", config = function()
    require('hoka.plugins.mason')
  end
  })
  use({ "neovim/nvim-lspconfig", after = "mason-lspconfig.nvim", config = function()
    require('hoka.plugins.lspconfig')
  end
  })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "onsails/lspkind-nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim", config = function()
    require('hoka.plugins.null-ls')
  end
  })
  use({ "hrsh7th/nvim-cmp", config = function()
    require("hoka.plugins.cmp")
  end
  })
end

local function colorscheme_plugins(use)
  --use({
  --  'svrana/neosolarized.nvim',
  --  requires = { 'tjdevries/colorbuddy.nvim' },
  --  config = function()
  --    require('hoka.plugins.neosolarized')
  --  end
  --})
  use({
    'folke/tokyonight.nvim',
    config = function()
      require('hoka.plugins.tokyonight')
    end
  })
  use({ 'folke/lsp-colors.nvim', config = function()
    require('hoka.plugins.lsp-colors')
  end
  })
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  ui_plugins(use)
  tools_plugins(use)
  colorscheme_plugins(use)
  lsp_plugins(use)



  if packer_bootstrap then
    require('packer').sync()
  end
end)
