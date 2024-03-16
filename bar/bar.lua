mod = {}

local DEFAULT_CONFIG = {
    margin = 16,
    position = Number2(margin,margin),
    colorBar = Color.Red,
    colorBg = Color.Black,
    width = 500,
    height = 50,
    -- Min is always 0, might change to support negatives numbers
    min = 0,
    max = 100,
    value = 0,
}

local conf = require("config")
local ui = require("uikit")

mod.createBar = function(self, config)
    config = conf:merge(DEFAULT_CONFIG, config)

    local bg = ui:createFrame(config.colorBg)
    bg.Width = config.width
    bg.Height = config.height

    local bar = ui:createFrame(config.colorBar)
    bar.multiplier = config.value / config.max

    if config.value > config.max then config.value = config.max end
    bar.Width = bar.multiplier * config.width - config.margin
    bar.Height = bg.Height - config.margin
	bar.pos.X = config.position
	bar.pos.Y = config.position

    return bg
end

mod.updateBar = function(self, bar, value)
end

return mod
