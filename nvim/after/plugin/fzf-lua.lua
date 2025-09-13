local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>gg', fzf.live_grep_native)
vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader>fh', fzf.oldfiles)
vim.keymap.set('n', '<leader>fg', fzf.git_status)
vim.keymap.set('n', '<leader>fr', fzf.lsp_references)
vim.keymap.set('n', '<leader>fi', fzf.lsp_implementations)
vim.keymap.set('n', '<leader>fb', fzf.buffers)
fzf.register_ui_select()

function toggle_cwd(sel, opts)
  local cwd = opts.cwd
  if cwd == vim.fn.expand('%:p:h') then 
    cwd = vim.fn.getcwd()
  else
    cwd = vim.fn.expand('%:p:h')
  end
  local o = vim.tbl_deep_extend("keep", {
    -- grep|live_grep sets `opts._cmd` to the original
    -- command without the search argument
    cwd = cwd,
    resume = true
  }, opts.__call_opts)
  opts.__call_fn(o)
end

fzf.setup({
  hide = true,
  fzf_bin = 'sk',
  winopts = {
    -- Position the floating window on the right side
    height = 0.30,  -- Window height 
    width = 0.90,   -- Narrow width for a column 
    row = 0.05,     -- Near the top 
    col = 0.5,     -- Far right 
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
  keymap = {
    fzf = {
      ["ctrl-j"] = "down",
      ["ctrl-k"] = "up",
      ["ctrl-l"] = "toggle",
      ["ctrl-a"] = "toggle-all",
    },
  },
  files = {
    no_ignore         = true,         -- respect ".gitignore"  by default
    actions = {
      ["ctrl-d"]      = toggle_cwd,
    },
  },
  grep = {
    actions = {
      -- actions inherit from 'actions.files' and merge
      -- this action toggles between 'grep' and 'live_grep'
      ["default"] = function(sel, opts)
        if sel then
          -- Open the selected file
          fzf.actions.file_edit_or_qf(sel, opts)
          local query = sel[1]
          -- Set the search term in the / register for n/N navigation
          vim.api.nvim_feedkeys(string.format("/%s\n",query), "n", false)
        end
      end,
      ["ctrl-d"] = toggle_cwd,
      ["ctrl-l"] = function(sel, opts)
        local o = vim.tbl_deep_extend("keep", {
          -- grep|live_grep sets `opts._cmd` to the original
          -- command without the search argument
          cmd = fzf.utils.toggle_cmd_flag(assert(opts._cmd or opts.cmd), assert(" --files-with-matches")),
        }, opts.__call_opts)
        opts.__call_fn(o)
      end,
    },
  }
})
