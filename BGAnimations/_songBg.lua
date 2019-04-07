local magnitude = 0.03
local maxDistX = SCREEN_WIDTH*magnitude
local maxDistY = SCREEN_HEIGHT*magnitude
local brightness = 0.3

local enabled = themeConfig:get_data().global.SongBGEnabled and not(GAMESTATE:IsCourseMode())

local t = Def.ActorFrame{}

if enabled then
	t[#t+1] = Def.Quad{
		
	}
end

return t