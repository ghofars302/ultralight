return Def.ActorFrame{
	Def.Quad{
		Name="Horizontal";
		InitCommand=function(self)
			self:x(48):y(14):zoomto(SCREEN_CENTER_X,32):diffuse(color("1,1,1,0.175")):blend(Blend.Add):vertalign(bottom):fadeleft(0.25):faderight(0.5)
		end;
	};
	Def.Quad{
		Name="Vertical";
		InitCommand=function(self)
			self:x(48):y(14):zoomto(SCREEN_CENTER_X,32):diffuse(color("1,1,1,0.05")):blend(Blend.Add):vertalign(bottom):fadetop(0.85)
		end;
	};

	-- bottom line
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH,2):y(16):diffuserightedge(HSV(192,1,1)):shadowlengthy(1.75):shadowcolor(HSVA(204,0.625,0.5,0.5))
		end;
		OffCommand=function(self)
			self:linear(0.5):cropleft(1)
		end;
	};
};