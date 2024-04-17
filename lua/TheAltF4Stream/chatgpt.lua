local chatgpt = require 'chatgpt'

local function init()
    local api_key_cmd = "doppler secrets get OPENAI_API_KEY --plain"

    chatgpt.setup({
        api_key_cmd = api_key_cmd,
        openai_edit_params = { model = "gpt-4" },
        openai_params = { model = "gpt-4" },
    })

    local options = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>ga', '<CMD>ChatGPTActAs<CR>', options)
    vim.keymap.set('n', '<leader>gg', '<CMD>ChatGPT<CR>', options)
    vim.keymap.set('v', '<leader>ge', '<CMD>ChatGPTEditWithInstruction<CR>', options)
    vim.keymap.set('v', '<leader>gb', '<CMD>ChatGPTRun fix_bugs<CR>', options)
    vim.keymap.set('v', '<leader>go', '<CMD>ChatGPTRun optimize_code<CR>', options)
    vim.keymap.set('v', '<leader>gs', '<CMD>ChatGPTRun summarize<CR>', options)
    vim.keymap.set('v', '<leader>gt', '<CMD>ChatGPTRun add_tests<CR>', options)
end

return {
    init = init
}
