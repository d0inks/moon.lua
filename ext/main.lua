if game.PlaceId == 114234929420007 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/d0inks/moon.lua/refs/heads/main/bloxstrike.lua"))() --bloxstrike
elseif game.PlaceId == 301549746 or game.PlaceId == 1480424328 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/d0inks/moon.lua/refs/heads/main/counterblox.lua"))() -- counterblox
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/d0inks/moon.lua/refs/heads/main/universal.lua"))() --universal
    print("Moon.lua Universal")
    print("pls be aware some functions might not work depending on what game ur using.")
end
