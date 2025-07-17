vim.g.mapleader = ' '
require('plugins')
require('set')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    --local capabilities = require('blink.cmp').get_lsp_capabilities(config.cappabilties);
    if client:supports_method('textDocument/diagnostic') then
      vim.api.nvim_set_keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
    end
    if client:supports_method('textDocument/definition') then
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    end

    -- Check if the LSP server supports document_formatting
    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
      vim.keymap.set('n', 'gF', function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
      end)
    end
    -- grn   vim.lsp.buf.code_action
    -- gd    vim.lsp.buf.definition
    -- gri   vim.lsp.buf.implementation
    -- grf   vim.lsp.buf.references

  end,
})
