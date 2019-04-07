local t = Def.ActorFrame{
	Font("mentone","24px") .. {
		Text="ultralight";
		InitCommand=function(self)
			self:strokecolor(HSVA(0,0,0,0)):halign(1):shadowlength(1):shadowcolor(HSVA(192,1,0.5,0.75))
		end;
		OnCommand=function(self)
			self:queuecommand("Anim")
		end;
		AnimCommand=function(self)
			self:linear(1):diffusebottomedge(HSV(192,0.5,0.825))
		end;
		OffCommand=function(self)
			self:decelerate(0.25):zoomy(0)
		end;
	};
	Font("mentone","24px") .. {
		Text="ultralight";
		InitCommand=function(self)
			self:strokecolor(HSVA(0,0,0,0)):halign(1):shadowlength(0):blend(Blend.Add)
		end;
		OnCommand=function(self)
			self:queuecommand("Anim")
		end;
		AnimCommand=function(self)
			self:bounceend(0.375):zoom(2):diffusealpha(0)
		end;
	};
	Font("mentone","24px") .. {
		Text=themeInfo.FriendlyVersion.." / "..themeInfo.Date;
		-- was y,16;
		InitCommand=function(self)
			self:x(-38):y(12):zoomx(1024):zoomy(0.45):strokecolor(HSVA(0,0,0,0)):halign(1):valign(0):shadowlength(1):shadowcolor(HSVA(192,1,0.5,0.75))
		end;
		OnCommand=function(self)
			self:queuecommand("Anim")
		end;
		AnimCommand=function(self)
			self:accelerate(0.35):diffusebottomedge(HSV(192,0.5,0.9)):zoomx(0.45)
		end;
		OffCommand=function(self)
			self:decelerate(0.125):zoomy(180):sleep(0.002):accelerate(0.125):addy(SCREEN_CENTER_Y*1.5):zoomy(0.01)
		end;
	};
	Font("mentone","24px") .. {
		Text=themeInfo.Version;
		-- was y,16;
		InitCommand=function(self)
			self:x(-24):y(12):zoomx(1024):zoomy(0.45):strokecolor(HSVA(0,0,0,0)):halign(0):valign(0):shadowlength(1):shadowcolor(HSVA(192,1,0.5,0.75))
		end;
		OnCommand=function(self)
			self:queuecommand("Anim")
		end;
		AnimCommand=function(self)
			self:accelerate(0.35):diffusebottomedge(HSV(192,0.5,0.9)):zoomx(0.45)
		end;
		OffCommand=function(self)
			self:decelerate(0.125):zoomy(180):sleep(0.002):accelerate(0.125):addy(SCREEN_CENTER_Y*1.5):zoomy(0.01)
		end;
	};
};

return t;