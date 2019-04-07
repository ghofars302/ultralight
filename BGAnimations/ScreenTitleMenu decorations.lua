--InitUserPrefs();
local t = Def.ActorFrame {};

t[#t+1] = StandardDecorationFromFileOptional("Logo","Logo");
t[#t+1] = StandardDecorationFromFileOptional("VersionInfo","VersionInfo");
t[#t+1] = StandardDecorationFromFileOptional("CurrentGametype","CurrentGametype");
t[#t+1] = StandardDecorationFromFileOptional("NetworkStatus","NetworkStatus");

--[[
t[#t+1] = Def.ActorFrame{
	InitCommand=function(self)
		self:xy(SCREEN_LEFT+96,SCREEN_CENTER_Y*1.75)
	end;
	-- r o y g b i v by 45
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH/8,8)
		end;
		OnCommand=function(self)
			self:diffuse( HSV(315,1,1) );
			self:x(((SCREEN_WIDTH/8)*7)-(16*7));
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH/8,8)
		end;
		OnCommand=function(self)
			self:diffuse( HSV(270,1,1) );
			self:faderight(0.125);
			self:x(((SCREEN_WIDTH/8)*6)-(16*6));
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH/8,8)
		end;
		OnCommand=function(self)
			self:diffuse( HSV(225,1,1) );
			self:faderight(0.125);
			self:x(((SCREEN_WIDTH/8)*5)-(16*5));
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH/8,8)
		end;
		OnCommand=function(self)
			self:diffuse( HSV(180,1,1) );
			self:faderight(0.125);
			self:x(((SCREEN_WIDTH/8)*4)-(16*4));
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH/8,8)
		end;
		OnCommand=function(self)
			self:diffuse( HSV(135,1,1) );
			self:faderight(0.125);
			self:x(((SCREEN_WIDTH/8)*3)-(16*3));
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH/8,8)
		end;
		OnCommand=function(self)
			self:diffuse( HSV(90,1,1) );
			self:faderight(0.125);
			self:x(((SCREEN_WIDTH/8)*2)-(16*2));
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH/8,8)
		end;
		OnCommand=function(self)
			self:diffuse( HSV(45,1,1) );
			self:faderight(0.125);
			self:x(((SCREEN_WIDTH/8)*1)-16);
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH/8,8)
		end;
		OnCommand=function(self)
			self:diffuse( HSV(0,1,1) );
			self:faderight(0.125);
			self:x((SCREEN_WIDTH/8)*0);
		end;
	};
};
--]]

local barXMin = SCREEN_WIDTH*0.1
local barXMax = SCREEN_WIDTH*0.9
local barWidth = 2;
local barHeight = 8;
local fadeAmount = 0; -- was 0.45, 0.2

for i=359,0,-1 do
	local initialDelay = i*0.25;
	t[#t+1] = Def.Quad{
		InitCommand=function(self)
			self:x(scale(i,0,360,barXMin,barXMax)):y(SCREEN_CENTER_Y*1.65):valign(1):zoomto(barWidth,barHeight):diffuse(HSV(i,1,1)):faderight(fadeAmount)
		end;
		OnCommand=function(self)
			self:queuecommand("MasterChamber")
		end;
		MasterChamberCommand=function(self)
			self:sleep(initialDelay):queuecommand("Wave")
		end;
		WaveCommand=function(self)
			self:bounceend(0.5):zoomy(math.random(barHeight*2.5,barHeight*3)):decelerate(0.5):zoomy(barHeight):sleep(15*0.25):queuecommand("Wave")
		end;
		Wave1Command=function(self)
			self:sleep(scale(i,359,0,0,0.5)*i):linear(0.25):zoomy(12):decelerate(0.5):zoomy(8):sleep(scale(i,359,0,0,0.5)*i):queuecommand("Wave")
		end;
		OffCommand=function(self)
			self:stoptweening():linear(0.02):zoomy(barHeight):sleep(scale(i,359,0,0,0.005)*i):decelerate(0.15):x(scale(i,0,359,SCREEN_LEFT,SCREEN_RIGHT)):zoomx((360/SCREEN_WIDTH)):zoomy(SCREEN_HEIGHT):y(SCREEN_BOTTOM):sleep(scale(i,359,0,0,0.0005)*i):decelerate(0.03):zoomx(32):diffusealpha(0)
		end;
	};
end;

return t