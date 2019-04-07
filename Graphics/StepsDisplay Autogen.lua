local t = Def.ActorFrame{};

-- autogen for older stepmanias.
--[[
t[#t+1] = LoadFont("common normal") .. {
	InitCommand=function(self)
		self:settext("AG"):strokecolor(color("#00000000")):zoom(0.8)
	end;
};
--]]

return t;