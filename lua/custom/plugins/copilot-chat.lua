return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
  },
  build = 'make tiktoken',
  opts = {
    -- See Configuration section for options
    model = 'claude-opus-4.5',
    auto_insert_mode = true,
    window = {
      width = 0.3,
    },
  },
}
