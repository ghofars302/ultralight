return Def.ActorFrame {
	-- line
	Def.Quad{
		InitCommand=function(self)
			self:x(48):y(16):zoomto(SCREEN_CENTER_X,2):diffuse(color("1,1,1,0.5")):fadeleft(0.25):faderight(0.25)
		end;
	};
};