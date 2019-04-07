-- this is only used for post-selection so far
local t = Def.ActorFrame{};

t[#t+1] = Def.Sprite{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_TOP-128):visible(false)
	end;
	SetCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			if GAMESTATE:GetCurrentCourse() then
				self:LoadBackground(GAMESTATE:GetCurrentCourse():GetBackgroundPath());
			end;
		else
			if GAMESTATE:GetCurrentSong() then
				self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath());
			end;
		end;

		local w, h = self:GetWidth(), self:GetHeight();
		local aspect = w/h;
		-- notable banner aspect ratios:
		-- 3.2 (256x80 [ddr]; 512x160 doublesized)
		-- 1.5 (300x200; 204x153 real [pump])
		-- 3.0 (300x100 [pump pro])
		-- 2.54878 (418x164 [itg])
		if h >= 128 then
			-- banner height may be too tall and obscure information, scale it
			local newZoomY = scale(h, 128,200, 80,100);
			local newZoomX = self:GetWidth() * newZoomY/self:GetHeight();
			self:zoomto(newZoomX,newZoomY);
		else
			self:zoomto(w,h)
		end;
	end;
	CurrentSongChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentCourseChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	ShowPressStartForOptionsCommand=function(self)
		self:visible(true):sleep(0.4):decelerate(1):y(SCREEN_CENTER_Y*0.75)
	end;
	OffCommand=function(self)
		self:sleep(0.75):bouncebegin(0.375):zoomx(0)
	end;
};

t[#t+1] = LoadFont("Common normal")..{
	Text="Press [ENTER] to enter Player Options";
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*1.35):vertalign(bottom):NoStroke():shadowlength(1):shadowcolor(color("0,0,0,0.375"))
	end;
	OnCommand=function(self)
		self:visible(false)
	end;
	ShowPressStartForOptionsCommand=function(self)
		self:hibernate(0.5):visible(true):zoom(1.5):decelerate(1):zoom(1)
	end;
	ShowEnteringOptionsCommand=function(self)
		self:settext("Entering Player Options...")
	end;
	OffCommand=function(self)
		self:sleep(0.8):bouncebegin(0.375):zoomy(0)
	end;
};

-- todo: add player information?

t[#t+1] = LoadFont("Common normal")..{
	Name="Title";
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+12):diffusealpha(0):zoom(1.25):valign(1):strokecolor(color("#00000000"))
	end;
	SetCommand=function(self)
		local SongOrCourse, text = nil, "";
		if GAMESTATE:IsCourseMode() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
		else
			SongOrCourse = GAMESTATE:GetCurrentSong();
		end;
		if SongOrCourse then
			text = SongOrCourse:GetDisplayFullTitle();
		end;
		self:settext(text);
	end;
	CurrentSongChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentCourseChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	ShowPressStartForOptionsCommand=function(self)
		self:linear(1):diffusealpha(1):zoom(1)
	end;
	OffCommand=function(self)
		self:sleep(1.5):bouncebegin(0.5):zoomy(0)
	end;
};

-- todo: localize stage text stuff
t[#t+1] = LoadFont("Common normal")..{
	Name="Secondary";
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+10):diffusealpha(0):zoom(1):valign(0):strokecolor(color("#00000000"))
	end;
	SetCommand=function(self)
		local SongOrCourse, text = nil, "";
		if GAMESTATE:IsCourseMode() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
			if SongOrCourse then
				local stages = SongOrCourse:GetEstimatedNumStages();
				if stages == 1 then
					text = string.format(ScreenString("%i stage"),stages)
				else
					text = string.format(ScreenString("%i stages"),stages)
				end;
			end;
		else
			SongOrCourse = GAMESTATE:GetCurrentSong();
			if SongOrCourse then
				text = SongOrCourse:GetDisplayArtist()
			end;
		end;
		self:settext(text);
	end;
	CurrentSongChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentCourseChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	ShowPressStartForOptionsCommand=function(self)
		self:linear(1):diffusealpha(1):zoom(0.8)
	end;
	OffCommand=function(self)
		self:sleep(1.55):bouncebegin(0.5):zoomy(0)
	end;
};

t[#t+1] = LoadActor("_bottombar")

return t;