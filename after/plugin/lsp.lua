vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('after-lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil or client.name == 'copilot' then return end

    local buf = event.buf
    vim.keymap.set('n', 'grh', vim.lsp.buf.hover, { buffer = buf, desc = 'Display [H]over Information' })
  end,
})
