vim.g.mapleader = ' '
vim.opt.nu = true
vim.opt.rnu = true
vim.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.scrolloff = 4
vim.opt.colorcolumn = '80'
vim.opt.list = true
vim.opt.hlsearch = true
vim.opt.listchars = {
  space = ".",
  trail = ".",
  tab = "> ",
}
vim.opt.sessionoptions = "buffers,curdir,tabpages,winsize,winpos,terminal,localoptions"
vim.g.clipboard = 'osc52'
if vim.env.TMUX ~= nil then
  local copy = {'tmux', 'load-buffer', '-w', '-'}
  local paste = {'zsh', '-c', 'tmux refresh-client -l && sleep 0.05 && tmux save-buffer -'}
  vim.g.clipboard = {
    name = 'tmux',
    copy = {
      ['+'] = copy,
      ['*'] = copy,
    },
    paste = {
      ['+'] = paste,
      ['*'] = paste,
    },
    cache_enabled = 0,
  }
end
vim.opt.termguicolors = true
vim.keymap.set('n', '<C-j>', ':cnext<CR>', { desc = 'Next quickfix' })
vim.keymap.set('n', '<C-k>', ':cprev<CR>', { desc = 'Previous quickfix' })
vim.keymap.set('n', '<C-l>', ':BufSurfForward<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-h>', ':BufSurfBack<CR>', { desc = 'Previous buffer' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {silent=true})
require('plugins')
vim.cmd('colorscheme ayu')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    --local capabilities = require('blink.cmp').get_lsp_capabilities(config.cappabilties);
    vim.api.nvim_set_keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_option(args.buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)


    -- Check if the LSP server supports document_formatting
    vim.api.nvim_buf_set_option(args.buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    vim.keymap.set('n', 'gF', function()
      vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
    end)
  end,
})
