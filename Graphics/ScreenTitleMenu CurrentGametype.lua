local icon = GetGameIcon()

local t = Def.ActorFrame{
	LoadActor( THEME:GetPathG("","_stepstype/"..icon) )..{
		InitCommand=function(self)
			self:x(88):y(20):Real()
		end;
		OffCommand=function(self)
			self:accelerate(0.25):addy(SCREEN_CENTER_Y*1.5)
		end;
	};
	Font("mentone","24px") .. {
		InitCommand=function(self)
			self:shadowlength(2):halign(0):valign(0):zoom(0.5):NoStroke()
		end;
		BeginCommand=function(self)
			self:settextf( ScreenString("CurrentGametype"), GAMESTATE:GetCurrentGame():GetName() );
		end;
		OnCommand=function(self)
			self:addx(-SCREEN_CENTER_X):queuecommand("Anim")
		end;
		AnimCommand=function(self)
			self:decelerate(0.5):addx(SCREEN_CENTER_X)
		end;
		OffCommand=function(self)
			self:decelerate(0.125):zoomy(180):sleep(0.002):accelerate(0.125):addy(SCREEN_CENTER_Y*1.5):zoomy(0.01)
		end;
	};
};
return t;