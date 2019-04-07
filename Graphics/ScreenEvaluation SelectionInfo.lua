return LoadFont("Common normal") .. {
	InitCommand=function(self)
		self:zoom(0.5):shadowlength(1):strokecolor(color("#00000033")):maxwidth(WideScale(512,640))
	end;
	BeginCommand=function(self)
		local Selection, text = nil, "";
		if GAMESTATE:IsCourseMode() then
			Selection = GAMESTATE:GetCurrentCourse();
			text = Selection:GetDisplayFullTitle();
		else
			Selection = GAMESTATE:GetCurrentSong();
			text = Selection:GetDisplayFullTitle() .." / ".. Selection:GetDisplayArtist();
		end;
		self:settext(text);
	end;
};