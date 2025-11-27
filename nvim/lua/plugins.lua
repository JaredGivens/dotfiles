-- install lazy if not found
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- install plugins
require("lazy").setup({
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      -- configure some basic settings
      notify.setup({
        stages = "fade_in_slide_out",  -- animation style
        timeout = 3000,                -- 3 seconds
        max_height = 10,
        max_width = 80,
        background_colour = "#000000",
      })
      -- override vim.notify
      vim.notify = notify
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {                                -- Default  Range
      cursor_color = "#f19618",
      time_interval = 7,                    -- 17
      stiffness = 0.8,                      -- 0.6      [0, 1]
      trailing_stiffness = 0.6,             -- 0.45     [0, 1]
      stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
      trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      damping = 0.95,                       -- 0.85     [0, 1]
      damping_insert_mode = 0.95,           -- 0.9      [0, 1]
      distance_stop_animating = 0.5,        -- 0.1      > 0
    },
  },
  "stevearc/overseer.nvim",
  { 
    "mfussenegger/nvim-dap",
    dependencies = { 
      "igorlfs/nvim-dap-view",
      "nvim-neotest/nvim-nio",
      'theHamsta/nvim-dap-virtual-text' 
    },
  },
  "numToStr/Comment.nvim",
  {
    "ton/vim-bufsurf",
    config = function() 
      vim.keymap.set('n', '<C-l>', ':BufSurfForward<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<C-h>', ':BufSurfBack<CR>', { desc = 'Previous buffer' })
    end,
  },
  {
    "prichrd/netrw.nvim",
    config = function()
      require("netrw").setup {}
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup {}
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = { automatic_enable = true },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  "bluz71/nvim-linefly",
  {
    "Shatur/neovim-ayu",
    config = function() 
      vim.cmd('colorscheme ayu')
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      { "<leader>fs", "<cmd>AutoSession search<CR>", desc = "Session search" },
    },
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
    session_lens = {
      picker = "fzf",
      mappings = {
        -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
        delete_session = { "i", "<C-d>" },
        alternate_session = { "i", "<C-s>" },
        copy_session = { "i", "<C-y>" },
      },
    },
  },
  --glsl syntax
  "tikhomirov/vim-glsl",
  "nvim-treesitter/nvim-treesitter",
  -- git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  -- latex
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end
  },
  -- jupyter notebooks
  { "GCBallesteros/jupytext.nvim", config = true, lazy = false },

  -- fzf
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },

  },
  -- icons
  "nvim-tree/nvim-web-devicons"
}, opts)
