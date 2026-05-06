-----------------------------------------------------------------------------
--- Custom keybindings
-----------------------------------------------------------------------------
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('after-lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil or client.name == 'copilot' then return end

    local buf = event.buf
    vim.keymap.set('n', 'grh', vim.lsp.buf.hover, { buffer = buf, desc = 'Display [H]over Information' })
  end,
})

-----------------------------------------------------------------------------
--- Custom LSP servers (Mason configuration)
-----------------------------------------------------------------------------
local servers = {
  ['beautysh'] = {},
  ['docker-language-server'] = {},
  ['html-lsp'] = {},
  ['lua-language-server'] = {},
  ['prettier'] = {},
  ['prettierd'] = {},
  ['python-lsp-server'] = {},
  ['yamlfix'] = {},
  ['texlab'] = {},
  ['tex-fmt'] = {},
  ['nginx-config-formatter'] = {},
  ['gopls'] = {},
  ['checkmake'] = {},
  ['isort'] = {},
  ['black'] = {},
  ['jdtls'] = {},
}
local ensure_installed = vim.tbl_keys(servers or {})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }
for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
