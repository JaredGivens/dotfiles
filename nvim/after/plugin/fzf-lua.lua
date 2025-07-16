local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>fh', fzf.oldfiles)
vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader>fd', fzf.lsp_workspace_diagnostics)
vim.keymap.set('n', '<leader>fc', function() 
  fzf.files({ cwd =  vim.fn.expand('%:p:h') })
end)
vim.keymap.set('n', '<leader>gw', fzf.live_grep_native)
vim.keymap.set('n', '<leader>gc', function() 
  fzf.live_grep_native({ cwd = vim.fn.expand('%:p:h') })
end)
vim.keymap.set('n', '<leader>fg', fzf.git_status)
vim.keymap.set('n', '<leader>fr', fzf.lsp_references)
vim.keymap.set('n', '<leader>fr', fzf.lsp_references)
vim.keymap.set('n', '<leader>fi', fzf.lsp_implementations)
vim.keymap.set('n', '<leader>fb', fzf.buffers)
vim.keymap.set('n', '<leader>fw', fzf.grep_cword)
fzf.register_ui_select()
fzf.setup({
  fzf_bin = 'sk',
  winopts = {
    -- Position the floating window on the right side
    height = 0.20,  -- Window height (85% of screen)
    width = 0.90,   -- Narrow width for a column (40% of screen)
    row = 0.95,     -- Near the top (5% from top)
    col = 0.5,     -- Far right (95% from left, aligns right edge)
    backdrop = 100, -- Keep backdrop opacity

    -- Preview configuration
    preview = {
      layout = "flex",     -- Force vertical layout (preview below files)
      vertical = "down:50%",   -- Preview takes 50% of fzf window height, below
      horizontal = "right:50%", -- Disable horizontal layout
      flip_columns = 0,        -- Disable flex switching to horizontal
      title = true,            -- Show preview title
      title_pos = "center",    -- Center title
      scrollbar = "float",     -- Floating scrollbar
      scrolloff = -1,          -- Scrollbar offset
      delay = 20,              -- Preview delay
    },

  },
  -- Optional: Keybindings for fzf-lua commands
  keymap = {
    fzf = {
      ["ctrl-j"] = "down",
      ["ctrl-k"] = "up",
    },
  },
})
