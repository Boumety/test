mod = {}

local DEFAULT_CONFIG = {
    margin = 8,
    colorBar = Color.Red,
    colorBg = Color.Black,
    width = 500,
    height = 50,
    position = Number2(16,16),
    -- Min is always 0, might change to support negatives numbers
    min = 0,
    max = 100,
    value = 0,
	time = 1
}

local conf = require("config")
local ui = require("uikit")
local ease = require("ease")

mod.createBar = function(self, config)
    config = conf:merge(DEFAULT_CONFIG, config)
	config.min = 0
	
    local bg = ui:createFrame(config.colorBg)
    bg.Width = config.width
    bg.Height = config.height
	bg.pos.X = config.position.X
	bg.pos.Y = config.position.Y
	
    local bar = ui:createFrame(config.colorBar)
    bar.multiplier = config.value / config.max

	bar:setParent(bg)
	
    if config.value > config.max then config.value = config.max end
    bar.Width = bar.multiplier * config.width - config.margin
    bar.Height = bg.Height - config.margin
	bar.pos.X = config.margin
    bar.pos.Y = config.margin


	bg.updateBar = function(value, callback)
		if type(value) ~= "number" or type(value) ~= "integer" then
			error("'value' should be a number or an integer")
		end

	    bar.multiplier = config.value / config.max
		ease:cancel()
		ease:inSine(bar, config.time).Width = bar.multiplier * config.width - config.margin
	end

	bg.updateConfig = function(newConfig)
		config = conf:merge(config, newConfig)
	end
	
    return bg
end


return mod
