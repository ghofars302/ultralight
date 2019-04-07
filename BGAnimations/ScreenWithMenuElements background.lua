local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(HSV(192,1,0.05)):diffusebottomedge(HSV(192,0.75,0.125))
		end;
	};
};

return t;