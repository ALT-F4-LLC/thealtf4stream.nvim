local notion = require 'notion'

local function init()
    local options = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>eb', '<CMD>NotionBrowser<CR>', options)
    vim.keymap.set('n', '<leader>ee', '<CMD>NotionEdit<CR>', options)

    notion.setup({
        database_id = '21f1a19994538010a449f9026b0e8552',
        notion_token_cmd = { 'doppler', 'secrets', 'get', '--plain', 'NOTION_TOKEN' }
    })
end

return {
    init = init,
}
