-----------------------------------------------------------------------------
--- Autoformat configuration (stevearc/conform.nvim)
-----------------------------------------------------------------------------
require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
    typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    html = { 'prettier', stop_after_first = true },
    markdown = { 'prettier', stop_after_first = true },
    json = { 'prettier', stop_after_first = true },
    yaml = { 'yamlfix', stop_after_first = true },
    sh = { 'beautysh', stop_after_first = true },
    tex = { 'tex-fmt', stop_after_first = true },
    dockerfile = { 'docker-language-server', stop_after_first = true },
    nginx = { 'nginx-config-formatter', stop_after_first = true },
    go = { 'gopls', stop_after_first = true },
    make = { 'checkmake', stop_after_first = true },
    python = { 'black', 'isort' },
    java = { 'jdtls', stop_after_first = true },
  },
}
