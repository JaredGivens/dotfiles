-- install lazy if not found
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- install plugins
require('lazy').setup({
  --glsl syntax
  'tikhomirov/vim-glsl',
  'nvim-treesitter/nvim-treesitter',
  -- git integration
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  -- latex
  {
    'lervag/vimtex',
    init = function()
      vim.g.vimtex_view_method = 'zathura'
    end
  },
  -- jupyter notebooks
  { 'GCBallesteros/jupytext.nvim', config = true, lazy = false },

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
    }
  },
  -- icons
  'nvim-tree/nvim-web-devicons'
}, opts)
