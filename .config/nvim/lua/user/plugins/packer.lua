local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim";


-- Automatically installs Packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  });

  print("👷 Installing Packer... Restart Neovim");

  vim.cmd([[packadd packer.nvim]]);
end

-- Reloads Neovim whenever you save plugins.lua file
vim.cmd([[
  augroup packer_use_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]);

-- Protected call so we don't error out on first call
local status_ok, packer = pcall(require, "packer");

if not status_ok then
  return;
end

-- Have Packer in a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" });
    end,
  }
});

-- Plugins

return packer.startup(function(use)
  use("wbthomason/packer.nvim");          -- Packer
  use("nvim-lua/popup.nvim");             -- Implementation of Popup API from vim in neovim
  use("nvim-lua/plenary.nvim");           -- Lua util functions
  use("kyazdani42/nvim-web-devicons");    -- Devicons
  use("kyazdani42/nvim-tree.lua");        -- Nvim-Tree
  use "akinsho/toggleterm.nvim";          -- Toggleterm
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })                                      -- Theme




  -- Telescope [START]
  use("nvim-telescope/telescope.nvim");
  use("nvim-telescope/telescope-ui-select.nvim");
  use "tom-anders/telescope-vim-bookmarks.nvim";
  use "nvim-telescope/telescope-file-browser.nvim";
  -- Telescope [END]



  -- Treesitter [START]
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  });
  use("p00f/nvim-ts-rainbow");
  -- Treesitter [END]



  -- Better comments [START]
  use("JoosepAlviste/nvim-ts-context-commentstring");
  use("numToStr/Comment.nvim");
  -- Better comments [END]



  -- Bufferline [START]
  use("akinsho/bufferline.nvim");
  use("moll/vim-bbye");
  -- Bufferline [END]



  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  };



  if PACKER_BOOTSTRAP then
    require("packer").sync();
  end
end);

