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
        claude = {
            api_key_name = { "doppler", "secrets", "get", "--plain", "ANTHROPIC_API_KEY" },
            model = "claude-3-7-sonnet-20250219",
        },
        openai = {
            api_key_name = { "doppler", "secrets", "get", "--plain", "OPENAI_API_KEY" },
            model = "o3-mini",
        },
    })
end

return {
    init = init,
}
