local x = Def.ActorFrame{
    Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(HSV(192,1,0.05)):diffusebottomedge(HSV(192,0.75,0.125))
		end
	};
	Def.Quad{
		Name="TopLine";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-40):zoomto(SCREEN_WIDTH,2):diffuserightedge(HSV(192,1,0.8)):cropleft(1)
		end;
		OnCommand=function(self)
			self:decelerate(0.75):cropleft(0)
		end;
        OffCommand=function(self)
            self:sleep(0.3)
			self:bouncebegin(0.5):cropright(1)
		end;
	};
	Def.Quad{
		Name="BottomLine";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+40):zoomto(SCREEN_WIDTH,2):diffuseleftedge(HSV(192,1,0.8)):cropright(1)
		end;
		OnCommand=function(self)
			self:decelerate(0.75):cropright(0)
		end;
        OffCommand=function(self)
            self:sleep(0.3)
			self:bouncebegin(0.5):cropleft(1)
		end;
	};
	Font("mentone","24px")..{
		Text="Stage Failed";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):diffuse(color("1,1,1,1")):shadowlength(1):strokecolor(color("0,0,0,0"))
		end;
        OffCommand=function(self)
            self:sleep(1)
			self:linear(0.15):diffusealpha(0)
		end;
	};
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		setenv("Network",false) -- reset network env
		if SCREENMAN:GetTopScreen():HaveProfileToLoad() then self:sleep(1); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;