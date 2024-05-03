local text = {
	pool = {},
	defaultConfig = {
		Anchor = { 0.5, 0.5 },
		BackgroundColor = Color.White,
		Color = Color.Black,
		FontSize = 22.0,
		IsUnlit = false,
		--Layers = ,
        MaxDistance = 350.0,
        MaxWidth = 0,
        Padding = 8,
        --ScreenToWorldFactor = 
        Tail = false,
        Text = "",
        Type = TextType.World,
	},
}

local mt = {
}

setmetatable(text, mt)

return text
