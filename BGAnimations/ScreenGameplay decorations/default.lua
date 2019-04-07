local t = LoadFallbackB();

--t[#t+1] = StandardDecorationFromFile( "StageFrame", "StageFrame" );

t[#t+1] = LoadActor("_warning")..{
	InitCommand=function(self)
		self:Center()
	end;
	OnCommand=function(self)
		self:diffusealpha(0)
	end;
	ShowDangerAllMessageCommand=function(self)
		self:stoptweening():accelerate(0.3):diffusealpha(1)
	end;
	HideDangerAllMessageCommand=function(self)
		self:stoptweening():accelerate(0.3):diffusealpha(0)
	end;
};

t[#t+1] = StandardDecorationFromFile( "NowPlaying", "NowPlaying" );
t[#t+1] = StandardDecorationFromFile( "StageDisplay", "StageDisplay" );

-- Song Meter Display
t[#t+1] = Def.ActorFrame{
	Name="SongMeterDisplayFrame";
	InitCommand=function(self)
		self:xy(SCREEN_CENTER_X,SCREEN_TOP+20)
	end;

	Def.Quad{
		Name="LineBG";
		InitCommand=function(self)
			self:zoomto((SCREEN_WIDTH*0.6)-2,6):diffuse(color("0,0,0,0.375"))
		end;
	};
	Def.Quad{
		Name="LineMain";
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH*0.6,1):diffusealpha(0.75)
		end;
	};
	Def.Quad{
		Name="LineLeft";
		InitCommand=function(self)
			self:x(-(SCREEN_WIDTH*0.6)/2):zoomto(1,6):diffusealpha(0.75)
		end;
	};
	Def.Quad{
		Name="LineRight";
		InitCommand=function(self)
			self:x((SCREEN_WIDTH*0.6)/2):zoomto(1,6):diffusealpha(0.75)
		end;
	};
	Def.SongMeterDisplay {
		InitCommand=function(self)
			self:SetStreamWidth(SCREEN_WIDTH*0.6)
		end;
		Stream=Def.Actor{};
		Tip=Def.ActorFrame{
			Def.Quad{
				InitCommand=function(self)
					self:zoomto(6,6):diffuse(HSV(48,0.8,0)):rotationz(45):pulse():effectclock('beatnooffset'):effectmagnitude(1,0.75,1)
				end;
			};
			Def.Quad{
				InitCommand=function(self)
					self:zoomto(4,4):diffuse(HSV(48,0.8,1)):rotationz(45):pulse():effectclock('beatnooffset'):effectmagnitude(1,0.75,1)
				end;
			};
		};
	};
};

--- blah
--t[#t+1] = StandardDecorationFromFile( "LifeFrame", "LifeFrame" );
--t[#t+1] = StandardDecorationFromFile( "ScoreFrame", "ScoreFrame" );

--[[
if ShowStandardDecoration("ModIconRows") then
	for pn in ivalues(PlayerNumber) do
		local t2 = Def.ModIconRow {
				InitCommand=function(self)
					self:Load("ModIconRowGameplay"..ToEnumShortString(pn),pn)
				end;
			};	
		t[#t+1] = StandardDecorationFromTable( "ModIconRow" .. ToEnumShortString(pn), t2 );
	end
end
--]]

t[#t+1] = StandardDecorationFromFile( "BPMDisplay", "BPMDisplay" );

return t;