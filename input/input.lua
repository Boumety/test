mod = {}

local ui = require("uikit")
local DEFAULT_CALLBACK = function() end
local DEFAULT_CONFIG = {
    text = "Please enter an input.",
    inText = "Type something here...",
    bgColor = Color(0,0,0,25),
}

mod.input = function(callback, config)
    callback = callback or DEFAULT_CALLBACK

    if type(callback) ~= "function" then
        error("'callback' should be a function")
    end

	config = require("config"):merge(DEFAULT_CONFIG, config)
    
    local bg = ui:createFrame(config.bgColor)
    bg.Width =

    local textInput = ui:createTextInput("", config.inText)
end

return mod
