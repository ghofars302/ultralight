local t = Def.ActorFrame{
	Def.Quad{
		Name="TopLine";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*0.6):zoomto(SCREEN_WIDTH,2):diffuserightedge(HSV(192,1,0.8))
		end;
		OffCommand=function(self)
			self:linear(0.3):cropright(1)
		end;
		CancelCommand=function(self)
			self:linear(0.3):cropleft(1)
		end;
	};
	Font("mentone","24px") .. {
		Text=HeaderString("SelectMode");
		InitCommand=function(self)
			self:x(SCREEN_LEFT+32):y(SCREEN_CENTER_Y*0.585):zoomx(0.8):halign(0):valign(1):shadowlength(1):zoomy(0):NoStroke()
		end;
		OnCommand=function(self)
			self:bounceend(0.5):zoomy(0.8):diffusebottomedge(HSV(192,0.2,0.8))
		end;
		OffCommand=function(self)
			self:linear(0.3):faderight(1):cropright(1)
		end;
		CancelCommand=function(self)
			self:bouncebegin(0.3):zoomy(0)
		end;
	};
	Def.Quad{
		Name="BottomLine";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*1.4):zoomto(SCREEN_WIDTH,2):diffuseleftedge(HSV(192,1,0.8))
		end;
		OffCommand=function(self)
			self:linear(0.3):cropleft(1)
		end;
		CancelCommand=function(self)
			self:linear(0.3):cropright(1)
		end;
	};
};

return t;