return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    'github/copilot.vim',
  },
  branch = 'main',
  cmd = 'CopilotChat',
  lazy = false,
  opts = function()
    local user = vim.env.USER or 'User'
    return {
      headers = {
        user = '😭  ' .. user .. ' ', -- Header to use for user questions
        assistant = '🤓  Copilot ', -- Header to use for AI answers
        tool = '🔪 Tool ', -- Header to use for tool calls
      },
      auto_insert_mode = false,
      window = {
        title = 'Copilot Chat',
        width = 0.3,
      },
      highlight_selection = false,
      mappings = {
        reset = {
          normal = '<C-r>',
          insert = '<C-r>',
        },
        close = {},
      },
    }
  end,
  keys = {
    { '<c-s>', '<CR>', ft = 'copilot-chat', desc = 'Submit Prompt', remap = true },
    {
      '<leader>aa',
      function() return require('CopilotChat').toggle() end,
      desc = 'Toggle (CopilotChat)',
      mode = { 'n', 'v' },
    },
    {

      '<leader>ax',
      function() return require('CopilotChat').reset() end,
      desc = 'Clear (CopilotChat)',
      mode = { 'n', 'v' },
    },
    {
      '<leader>aq',
      function()
        local input = vim.fn.input 'Quick Chat: '
        if input ~= '' then require('CopilotChat').ask(input) end
      end,
      desc = 'Quick Chat (CopilotChat)',
      mode = { 'n', 'v' },
    },
    -- Show prompts actions with telescope
    -- {
    --   '<leader>af',
    --   function()
    --     local actions = require 'CopilotChat.actions'
    --     require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
    --   end,
    --   desc = 'CopilotChat - Prompt actions',
    --   mode = { 'n', 'v' },
    -- },
  },

  config = function(_, opts)
    local chat = require 'CopilotChat'

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'copilot-chat',
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}
