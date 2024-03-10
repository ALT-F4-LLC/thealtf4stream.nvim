local chatgpt = require 'chatgpt'

local function init()
    local api_key_cmd = "doppler secrets get OPENAI_API_KEY --plain"

    chatgpt.setup({
        api_key_cmd = api_key_cmd,
        openai_params = { max_tokens = 128000, model = "gpt-4-turbo-preview" },
        openai_edit_params = { model = "gpt-4" }
    })

    local map = vim.api.nvim_set_keymap

    local options = { noremap = true }

    map('n', '<leader>ga', '<CMD>ChatGPTActAs<CR>', options)
    map('n', '<leader>gg', '<CMD>ChatGPT<CR>', options)
    map('v', '<leader>ge', '<CMD>ChatGPTEditWithInstructions<CR>', options)
    map('v', '<leader>gb', '<CMD>ChatGPTRun fix_bugs<CR>', options)
    map('v', '<leader>go', '<CMD>ChatGPTRun optimize_code<CR>', options)
    map('v', '<leader>gs', '<CMD>ChatGPTRun summarize<CR>', options)
    map('v', '<leader>gt', '<CMD>ChatGPTRun add_tests<CR>', options)
end

return {
    init = init
}
