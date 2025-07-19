local notion = require 'notion'

local function init()
    notion.setup({
        database_id = '21f1a19994538010a449f9026b0e8552',
        notion_token_cmd = { 'doppler', 'secrets', 'get', '--plain', 'NOTION_TOKEN' }
    })
end

return {
    init = init,
}
