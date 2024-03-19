local copilotchat = require("CopilotChat")
local copilotchat_select = require("CopilotChat.select")

local function CopilotChatWithInput()
    local input = vim.fn.input("Prompt: ")
    if input ~= "" then
        copilotchat.ask(input, { selection = copilotchat_select.visual })
    end
end

local function init()
    copilotchat.setup { debug = false }

    local options = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>cm', "<CMD>CopilotChatCommitStaged<CR>", options)
    vim.keymap.set('v', '<leader>ce', "<CMD>CopilotChatExplain<CR>", options)
    vim.keymap.set('n', '<leader>cf', "<CMD>CopilotChatFixDiagnostic<CR>", options)
    vim.keymap.set('v', '<leader>cd', "<CMD>CopilotChatDocs<CR>", options)
    vim.keymap.set('v', '<leader>co', "<CMD>CopilotChatOptimize<CR>", options)
    vim.keymap.set('v', '<leader>cp', CopilotChatWithInput, options)
    vim.keymap.set('v', '<leader>ct', "<CMD>CopilotChatTests<CR>", options)
end

return {
    init = init,
}
