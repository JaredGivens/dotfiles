vim.g.mapleader = ' '
require('plugins')
require('set')

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
