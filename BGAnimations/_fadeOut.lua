local time = ...
if not time then time = 0.5; end

return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(color("#00000000"))
		end;
		OnCommand=function(self)
			self:linear(time):diffusealpha(1)
		end;
	};
};