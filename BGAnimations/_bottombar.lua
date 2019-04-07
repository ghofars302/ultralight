return Def.ActorFrame {
    Def.Quad{
		Name="PlayerOptionsToolbar";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*1.65):addy(SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,2):diffuse(color("255, 255, 255, 1"))
		end;
		OnCommand=function(self)
			self:linear(0.3):y(SCREEN_BOTTOM-28)
		end;
		OffCommand=function(self)
			self:linear(0.3):addy(SCREEN_CENTER_Y-20)
		end;
		CancelCommand=function(self)
			self:linear(0.3):diffuseleftedge(HSV(192,1,0.8)):diffuserightedge(HSV(192,0,1))
		end;
	};
	Def.Quad{
		Name="TipBar";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*1.65):addy(SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,28):diffuse(color("0,0,0,1"))
		end;
		OnCommand=function(self)
			self:linear(0.3):y(SCREEN_BOTTOM-14)
		end;
		OffCommand=function(self)
			self:linear(0.3):addy(SCREEN_CENTER_Y-20)
		end;
	};
	LoadFont("Common Normal") .. {
		Text="Back";
		InitCommand=function(self)
			self:halign(1):x(SCREEN_CENTER_X-380):y(SCREEN_CENTER_Y*1.65):zoomto(25,23):addy(SCREEN_CENTER_Y):diffuse(color("255, 255, 255, 1"))
		end;
		LeftClickMessageCommand=function(self)
			if isOver(self) then
				Screen:SetPrevScreenName("SCREEN")
			end
		end;
		OnCommand=function(self)
			self:linear(0.3):y(SCREEN_BOTTOM-17)
		end;
		OffCommand=function(self)
			self:linear(0.3):addy(SCREEN_CENTER_Y-20)
		end;
	}
}