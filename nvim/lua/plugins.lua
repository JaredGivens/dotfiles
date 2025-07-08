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
  {
    "mason-org/mason-lspconfig.nvim",
    opts = { automatic_enable = true },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  'Shatur/neovim-ayu',
  --async make
  'tpope/vim-dispatch',
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

  -- fzf
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = { 'skim' }

  },
  -- icons
  'nvim-tree/nvim-web-devicons'
}, opts)
