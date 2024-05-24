local chatgpt = require 'chatgpt'

local function init()
    chatgpt.setup({
        api_key_cmd = "doppler secrets get OPENAI_API_KEY --plain",
        openai_edit_params = { model = "gpt-4o" },
        openai_params = { model = "gpt-4o" },
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
