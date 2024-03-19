local copilot_chat = require("CopilotChat")

local function init()
    copilot_chat.setup {
        debug = true,
    }

    local map = vim.api.nvim_set_keymap

    local options = { noremap = true }

    map('n', '<leader>co', '<CMD>:CopilotChatToggle<CR>', options)
end

return {
    init = init,
}
