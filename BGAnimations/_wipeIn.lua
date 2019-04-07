local time = ...
assert(time)
return Def.Quad{
	InitCommand=function(self)
		self:FullScreen():diffuse(HSV(192,1,0.05)):diffusebottomedge(HSV(192,0.75,0.125)):cropbottom(0):fadebottom(0)
	end;
	OnCommand=function(self)
		self:linear(time):cropbottom(1):fadebottom(1)
	end;
};