local copilot = require 'copilot'

local function init()
    -- Copilot setup
    copilot.setup {
        suggestion = {
            auto_trigger = true,
        }
    }
end

return {
    init = init,
}
