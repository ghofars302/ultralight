local headerText = ...
assert(headerText)

local t = Def.ActorFrame{
	Def.Quad{
		Name="TopLine";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*0.4):addy(-SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,2):diffuseleftedge(HSV(192,1,0.8))
		end;
		OnCommand=function(self)
			self:linear(0.3):addy(SCREEN_CENTER_Y)
		end;
		OffCommand=function(self)
			self:linear(0.3):addy(-SCREEN_CENTER_Y)
		end;
		CancelCommand=function(self)
			self:linear(0.3):diffuserightedge(HSV(192,1,0.8)):diffuseleftedge(HSV(192,0,1))
		end;
	};
	Font("mentone","24px") .. {
		Text=HeaderString(headerText);
		InitCommand=function(self)
			self:x(SCREEN_LEFT+32):y(SCREEN_CENTER_Y*0.38):addy(-SCREEN_CENTER_Y):zoom(0.8):halign(0):valign(1):shadowlength(1):strokecolor(color("0,0,0,0"))
		end;
		OnCommand=function(self)
			self:linear(0.5):addy(SCREEN_CENTER_Y):diffusebottomedge(HSV(192,0.2,0.8))
		end;
		OffCommand=function(self)
			self:linear(0.3):addy(-SCREEN_CENTER_Y)
		end;
		CancelCommand=function(self)
			self:bouncebegin(0.3):zoomy(0)
		end;
	};
	Def.Quad{
		Name="BottomLine";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*1.5):addy(SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,2):diffuserightedge(HSV(192,1,0.8))
		end;
		OnCommand=function(self)
			self:linear(0.3):addy(-SCREEN_CENTER_Y)
		end;
		OffCommand=function(self)
			self:linear(0.3):addy(SCREEN_CENTER_Y)
		end;
		CancelCommand=function(self)
			self:linear(0.3):diffuseleftedge(HSV(192,1,0.8)):diffuserightedge(HSV(192,0,1))
		end;
	};
};

return t;