mod = {}

local DEFAULT_NAME = "DATA_TRACKER_BY_BOUMETY"
local saved = false

mod.init = function(self, name)
    name = name or DEFAULT_NAME
    
    if type(name) ~= "string" then
        error("'name' should be a string")
    end
    
    local data = KeyValueStore(name)
	data:Set("players", {}, function(success)
        if success then
            print("The data tracker has been set up, you can now remove this line.")
        end
	end)
end

mod.delete = function(self, name)
    name = name or DEFAULT_NAME
    
    if type(name) ~= "string" then
        error("'name' should be a string")
    end
    
    local data = KeyValueStore(name)
	data:Set("players", nil, "world", nil, function(success)
	end)
end

mod.setPlayerData = function(self, player, name)
    name = name or DEFAULT_NAME
    player = player or Player.Username
    
    if type(name) ~= "string" then
        error("'name' should be a string")
    end

    if type(player) ~= "string" then
        error("'player' should be a string")
    end

    local tracked
    local p
    local data = KeyValueStore(name)
    data:Get("players", function(success, results)
		for i=#results.players,1,-1 do
			if results.players[i].username == player then
				tracked = true
                p = i
                break
			end
		end
            
		if tracked == false then
			table.insert(results.players, {username = Player.Username, userID = Player.UserID, first_connection = Time.Unix(), last_connection = Time.Unix(), playtime = 0, nb = 1, average_session = 0})
			data:Set("players", results.players, function(success)
			end)
            saved = true
        elseif tracked == true then
            if saved == false then
                results.players[p].last_connection = Time.Unix()
                results.players[p].nb = results.players[p].username + nb
                saved = true
            elseif saved == true then
                results.players[p].playtime = results.players[p].playtime + (Time.unix() - results.players[p].last_connection)
                results.players[p].average_session = results.players[p].playtime / results.players[p].nb
            end
		end
	end)
end

mod.getPlayerData = function(self, player, name)
    name = name or DEFAULT_NAME
    player = player or Player.Username
    
    if type(name) ~= "string" then
        error("'name' should be a string")
    end

    if type(player) ~= "string" then
        error("'player' should be a string")
    end

    local tracked
    local p
    local data = KeyValueStore(name)
    data:Get("players", function(success, results)
		for i=#results.players,1,-1 do
            print("1", results.players[i].username, player)
			if results.players[i].username == player then
				tracked = true
                p = i
                break
			end
		end
            
		if tracked == true then
            print("2", results.players[p], results.players[p].Username)
			return results.players[p]
        elseif tracked == false then
            warning("'" .. name .. "'" .. " has never joined your world")
		end
	end)
end

mod.getAllData = function(self, name)
    name = name or DEFAULT_NAME
    
    if type(name) ~= "string" then
        error("'name' should be a string")
    end

    local data = KeyValueStore(name)
    data:Get("players", function(success, results)
		return results.players
	end)
end

return mod
