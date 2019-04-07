return Def.ActorFrame {
	-- line
	Def.Quad{
		InitCommand=function(self)
			self:x(48):y(16):zoomto(SCREEN_CENTER_X,2):diffuse(color("1,1,1,0.5")):fadeleft(0.25):faderight(0.25)
		end;
	};
	-- roulette special stuff here

	-- lights
	Def.Quad{
		InitCommand=function(self)
			self:x(-80):zoomto(8,24):diffuse(HSVA(0,0,0.8,1)):diffusebottomedge(HSVA(0,0,0.35,1))
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:x(-80):zoomto(8,24):blend(Blend.Add):diffusealpha(0.25)
		end;
		OnCommand=function(self)
			self:rainbow()
		end;
	};
};