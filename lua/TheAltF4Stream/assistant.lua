local avante = require 'avante'
local avante_lib = require 'avante_lib'
local copilot = require 'copilot'

local function init()
    -- Copilot setup
    copilot.setup {
        suggestion = {
            auto_trigger = true,
        }
    }

    -- Avante setup
    avante_lib.load()

    avante.setup({
        provider = "claude",
        providers = {
            claude = {
                api_key_name = { "doppler", "secrets", "get", "--plain", "ANTHROPIC_API_KEY" },
                model = "claude-sonnet-4-20250514",
            },
        },
    })
end

return {
    init = init,
}
