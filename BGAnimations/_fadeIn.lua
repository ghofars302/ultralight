local time = ...
if not time then time = 0.5; end

return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(color("#000000FF"))
		end;
		OnCommand=function(self)
			self:linear(time):diffusealpha(0)
		end;
	};
};