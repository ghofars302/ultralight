local t = Def.ActorFrame{
	Font("mentone","24px") .. {
		Name="Above"; -- was Artist
		InitCommand=function(self)
			self:y(-8):zoom(0.8):horizalign(left):vertalign(bottom):NoStroke():shadowlength(1):maxwidth(SCREEN_CENTER_X*0.75)
		end;
		SetCommand=function(self)
			local text = "";
			if GAMESTATE:GetCurrentSong() then
				text = GAMESTATE:GetCurrentSong():GetDisplayArtist();
			elseif GAMESTATE:GetCurrentCourse() then
				local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber())
				if trail then
					local artists = trail:GetArtists();
					text = join(", ", artists);
				end;
			end;
			self:settext( text );
		end;
		CurrentSongChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		CurrentCourseChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		CurrentTrailP1ChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		CurrentTrailP2ChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		OffCommand=function(self)
			self:bouncebegin(0.35):addy(-SCREEN_CENTER_Y*1.25)
		end;
	};
	Font("mentone","24px") .. {
		Name="Below"; -- was Genre
		InitCommand=function(self)
			self:y(8):zoom(0.8):horizalign(left):vertalign(top):NoStroke():shadowlength(1):maxwidth(SCREEN_CENTER_X*0.75)
		end;
		SetCommand=function(self)
			local text = "";
			if GAMESTATE:GetCurrentSong() then
				text = GAMESTATE:GetCurrentSong():GetGenre();
			elseif GAMESTATE:GetCurrentCourse() then
				local numStages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages();
				if numStages == 1 then
					text = string.format(ScreenString("%i stage"),numStages)
				else
					text = string.format(ScreenString("%i stages"),numStages)
				end;
			end;
			self:settext( text );
		end;
		CurrentSongChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		CurrentCourseChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		OffCommand=function(self)
			self:bouncebegin(0.35):addy(SCREEN_CENTER_Y*1.25)
		end;
	};
};

return t;