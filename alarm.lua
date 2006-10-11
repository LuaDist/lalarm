-- alarm.lua
-- support code for alarm library
-- usage lua -lalarm ...

local function so(x)
	local SOPATH= os.getenv"LUA_SOPATH" or "./"
	assert(loadlib(SOPATH.."l"..x..".so","luaopen_"..x))()
end

so"alarm"
