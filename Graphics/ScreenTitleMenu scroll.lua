local gc = Var("GameCommand");
local focusZoom = 0.9 -- was 1
local unfocusZoom = 0.7 -- was 0.75
local cursorWidth = 160 -- was 192

return Def.ActorFrame {
	InitCommand=function(self)
		self:halign(0)
	end;
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(cursorWidth,26):diffuse(HSVA(192,0.8,1,0.45)):blend(Blend.Add):fadeleft(0.5):faderight(0.35):skewx(-0.1)
		end;
		OnCommand=function(self)
			self:glowshift():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,0.125"))
		end;
		GainFocusCommand=function(self)
			self:stoptweening():cropright(0):cropleft(1):linear(0.05):cropleft(0)
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():cropright(0):linear(0.05):cropright(1)
		end;
	};
	-- top add
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(cursorWidth,3):blend(Blend.Add):diffusealpha(0.125):vertalign(top):x(9.6):y(-13):fadebottom(0.9):skewx(-0.025)
		end;
		GainFocusCommand=function(self)
			self:visible(true)
		end;
		LoseFocusCommand=function(self)
			self:visible(false)
		end;
	};
	Font("mentone","24px") .. {
		Text=gc:GetText();
		OnCommand=function(self)
			self:x(-64):y(-1):strokecolor(HSVA(0,0,0,0)):horizalign(left):shadowlength(1)
		end;
		GainFocusCommand=function(self)
			self:stoptweening():bouncebegin(0.25):zoom(focusZoom):diffuse(HSVA(192,0.8,1,1))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():bounceend(0.25):zoom(unfocusZoom):diffuse(HSVA(192,0.0,0.8,0.85))
		end;
	};
};