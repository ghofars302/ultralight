local t = Def.ActorFrame{};

if ScreenMetric("Summary") then
	-- summary just uses the normal background
	t[#t+1] = Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(HSV(192,1,0.05)):diffusebottomedge(HSV(192,0.75,0.125))
		end
	}
elseif GAMESTATE:IsCourseMode() then
	-- course mode
	t[#t+1] = Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(HSVA(0,0.5,0.75,PREFSMAN:GetPreference("BGBrightness")))
		end,
		OnCommand=function(self)
			self:accelerate(1):diffuse(HSVA(0,0.5,0.75,0.5))
		end
	}
else
	-- song background
	t[#t+1] = LoadSongBackground()..{
		InitCommand=function(self)
			self:diffusealpha(PREFSMAN:GetPreference("BGBrightness"))
		end,
		OnCommand=function(self)
			self:accelerate(1):diffusealpha(0.5)
		end
	}
end;

local gradeFrameWidth = 156
local gradeFrameHeight = 28
local gradeFrameBorderSize = 2
-- score/grade frames
t[#t+1] = Def.ActorFrame{
	Name="P1ScoreFrame",
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X*0.3):y(SCREEN_TOP+120)
	end,
	BeginCommand=function(self)
		self:hide_if(not IsPlayerValid(PLAYER_1))
	end,
	Def.Quad{
		Name="Outer",
		InitCommand=function(self)
			self:zoomto(gradeFrameWidth+(gradeFrameBorderSize),gradeFrameHeight+(gradeFrameBorderSize)):diffuse(color("0,0,0,0.5"))
		end
	},
	Def.Quad{
		Name="Inner",
		InitCommand=function(self)
			self:x(-0.125):y(0.25):zoomto(gradeFrameWidth,gradeFrameHeight):diffuse(Brightness(PlayerColor(PLAYER_1),0.75))
		end
	},
	Def.Quad{
		Name="GradePart",
		InitCommand=function(self)
			self:x(gradeFrameWidth*0.5):y(0.25):halign(1):zoomto(gradeFrameWidth*0.325,gradeFrameHeight):diffuse(HSVA(0,0,0.9,0.8))
		end,
		BeginCommand=function(self)
			self:visible(THEME:GetMetric(Var "LoadingScreen","ShowGradeArea"))
		end
	},
	Def.Quad{
		Name="Under",
		InitCommand=function(self)
			self:y(20):zoomto(gradeFrameWidth+(gradeFrameBorderSize),4):fadeleft(0.35):faderight(0.35):diffusealpha(0.45):blend(Blend.Add)
		end
	},
	Def.Quad{
		Name="Under2",
		InitCommand=function(self)
			self:y(17):zoomto(gradeFrameWidth+(gradeFrameBorderSize),2):fadeleft(0.25):faderight(0.25):diffusealpha(0.625):blend(Blend.Add):skewx(-0.05)
		end
	},
}

t[#t+1] = Def.ActorFrame{
	Name="P2ScoreFrame",
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X*1.7):y(SCREEN_TOP+120)
	end,
	BeginCommand=function(self)
		self:hide_if(not IsPlayerValid(PLAYER_2))
	end,
	Def.Quad{
		Name="Outer",
		InitCommand=function(self)
			self:zoomto(gradeFrameWidth+(gradeFrameBorderSize),gradeFrameHeight+(gradeFrameBorderSize)):diffuse(color("0,0,0,0.5"))
		end
	},
	Def.Quad{
		Name="Inner",
		InitCommand=function(self)
			self:x(-0.125):y(0.25):zoomto(gradeFrameWidth,gradeFrameHeight):diffuse(Brightness(PlayerColor(PLAYER_2),0.75))
		end
	},
	Def.Quad{
		Name="GradePart",
		InitCommand=function(self)
			self:x(gradeFrameWidth*0.5):y(0.25):halign(1):zoomto(gradeFrameWidth*0.325,gradeFrameHeight):diffuse(HSVA(0,0,0.9,0.8))
		end,
		BeginCommand=function(self)
			self:visible(THEME:GetMetric(Var "LoadingScreen","ShowGradeArea"))
		end
	},
	Def.Quad{
		Name="Under",
		InitCommand=function(self)
			self:y(20):zoomto(gradeFrameWidth+(gradeFrameBorderSize),4):fadeleft(0.35):faderight(0.35):diffusealpha(0.45):blend(Blend.Add)
		end
	},
	Def.Quad{
		Name="Under2",
		InitCommand=function(self)
			self:y(17):zoomto(gradeFrameWidth+(gradeFrameBorderSize),2):fadeleft(0.25):faderight(0.25):diffusealpha(0.625):blend(Blend.Add):skewx(-0.05)
		end
	}
}

-- decoration lines
local middleX = WideScale(90,128)
local bannerSideX = WideScale(136,174)
local endSideX = WideScale(44,82)

t[#t+1] = Def.ActorFrame{
	Name="P1LineFrame",
	InitCommand=function(self)
		self:hide_if(not IsPlayerValid(PLAYER_1))
	end,
	Def.Quad{
		Name="LeftPart1",
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-bannerSideX):y(SCREEN_TOP+70):zoomto(4,146):cropbottom(1):diffusetopedge(PlayerColor(PLAYER_1))
		end,
		OnCommand=function(self)
			self:decelerate(0.5):cropbottom(0)
		end
	},
	Def.Quad{
		Name="LeftPart2",
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-middleX):y(SCREEN_TOP+144):zoomto(96,4):cropright(1)
		end,
		OnCommand=function(self)
			self:sleep(0.5):accelerate(0.5):cropright(0)
		end
	},
	Def.Quad{
		Name="LeftPart3",
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-endSideX):y(SCREEN_CENTER_Y*1.3425):zoomto(4,SCREEN_HEIGHT*0.75):diffusebottomedge(PlayerColor(PLAYER_1)):cropbottom(1)
		end,
		OnCommand=function(self)
			self:sleep(1):decelerate(0.5):cropbottom(0)
		end
	},
}

t[#t+1] = Def.ActorFrame{
	Name="P2LineFrame",
	InitCommand=function(self)
		self:hide_if(not IsPlayerValid(PLAYER_2))
	end,
	Def.Quad{
		Name="RightPart1",
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+bannerSideX):y(SCREEN_TOP+70):zoomto(4,146):cropbottom(1):diffusetopedge(PlayerColor(PLAYER_2))
		end,
		OnCommand=function(self)
			self:decelerate(0.5):cropbottom(0)
		end
	},
	Def.Quad{
		Name="RightPart2",
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+middleX):y(SCREEN_TOP+144):zoomto(96,4):cropleft(1)
		end,
		OnCommand=function(self)
			self:sleep(0.5):accelerate(0.5):cropleft(0)
		end
	},
	Def.Quad{
		Name="RightPart3",
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+endSideX):y(SCREEN_CENTER_Y*1.3425):zoomto(4,SCREEN_HEIGHT*0.75):diffusebottomedge(PlayerColor(PLAYER_2)):cropbottom(1)
		end,
		OnCommand=function(self)
			self:sleep(1):decelerate(0.5):cropbottom(0)
		end
	},
}

t[#t+1] = LoadActor("judgeBGs")

return t
