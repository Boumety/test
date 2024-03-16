emoji_converter = {}

local DEFAULT_CONFIG = {
  "😀" = {":)", ":-)",},
  "❤" = "<3",
  "😋" = {":p", ":-p",},
  "😁" = {":D", ":-D",},
  "😀" = {":)", ":-)",},
  "⚠" = "/!\",
}
local CONFIG = DEFAULT_CONFIG

local tableLength = function(tbl)
    local count = 0
    for _ in pairs(tbl) do count = count + 1 end
    return count
end

emoji_converter.setConfig = function(config)
    if type(config) ~= "table" then
        error("'config' should be a table")
    end
    CONFIG = config
end

emoji_converter.convert = function(text)
    if type(text) ~= "string" then
        error("'text' should be a string")
    end
    local s
    for i=#text,1,-1 do
        for a=#text,1,-1 do
            s = string.sub(text, i, a)
            for b=tableLength(CONFIG),1,-1 do
            end
        end
    end
end

return emoji_converter
