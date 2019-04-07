return LoadActor( THEME:GetPathG("OptionsCursor","CanGoLeft") )..{
	InitCommand=function(self)
		self:zoomx(-1)
	end;
};