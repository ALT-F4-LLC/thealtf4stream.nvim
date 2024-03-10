local copilot_chat = require("CopilotChat")

local function init()
    copilot_chat:setup({})

    local map = vim.api.nvim_set_keymap

    local options = { noremap = true }

    map('n', '<leader>co', '<CMD>:lua require("CopilotChat.code_actions").show_help_actions()<CR>', options)
    map('n', '<leader>cp', '<CMD>:lua require("CopilotChat.code_actions").show_prompt_actions()<CR>', options)
end

return {
    init = init,
}
