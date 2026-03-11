-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec

-- Custom keymaps
local keymap = vim.keymap.set
keymap('n', '<leader>c', ':CopilotChatToggle<CR>', { desc = 'Toggle [C]opilot chat' })
--keymap('n', '<leader>cr', ':CopilotChatReset<CR>', { desc = '[C]opilot chat [reset]' })

return {}
