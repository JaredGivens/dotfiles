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
      vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
    end
    if client:supports_method('textDocument/definition') then
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
      local def_result = vim.lsp.buf.definition()
      -- If definition fails (e.g., no result), try type definition
      if not def_result then
        vim.keymap.set('n', 'gd', function()
          vim.lsp.buf.definition()
          vim.lsp.buf.type_definition()
        end)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
      end
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
