return Def.Quad{
	InitCommand=function(self)
		self:zoomto(256,104):diffuse(PlayerColor(PLAYER_1)):diffusealpha(0.75):fadeleft(0.2):faderight(0.2)
	end;
};