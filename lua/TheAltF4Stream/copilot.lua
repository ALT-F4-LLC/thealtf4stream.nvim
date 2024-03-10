local copilot_chat = require("CopilotChat")

local function init()
    copilot_chat.setup()

    local map = vim.api.nvim_set_keymap

    local options = { noremap = true }

    map('n', '<leader>co', ':lua require("CopilotChat.code_actions").show_help_actions()', options)
    map('n', '<leader>cp', ':lua require("CopilotChat.code_actions").show_prompt_actions(true)', options)
end

return {
    init = init,
}
