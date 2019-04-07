local function DateAndTime()
	local c;
	local realMonth = (MonthOfYear()+1);
	local clockFrame = Def.ActorFrame{
		LoadFont("","mentone/_24px")..{
			Name="Date";
			InitCommand=function(self)
				self:horizalign(right):zoom(0.475):shadowlength(1):strokecolor(color("0,0,0,0"))
			end;
		};
		LoadFont("","mentone/_24px")..{
			Name="Time";
			InitCommand=function(self)
				self:horizalign(right):zoom(0.4):y(12):shadowlength(1):strokecolor(color("0,0,0,0"))
			end;
		};
	};
	local function UpdateDateTime(self)
		self:GetChild('Date'):settext( string.format("%04i/%02i/%02i",Year(),realMonth,DayOfMonth()) );
		self:GetChild('Time'):settext( string.format("%02i:%02i:%02i", Hour(), Minute(), Second()) );
	end;
	clockFrame.InitCommand=function(self)
		self:SetUpdateFunction(UpdateDateTime)
	end;
	return clockFrame;
end;

return Def.ActorFrame {
	DateAndTime()..{
		InitCommand=function(self)
			self:x(SCREEN_RIGHT-4):y(SCREEN_TOP+8)
		end;
	};

	-- system messages
	Def.Quad {
		InitCommand=function(self)
			self:diffuse(color("0,0,0,0")):zoomto(SCREEN_WIDTH,40):horizalign(left)
		end,
		SystemMessageMessageCommand=function(self,params)
			local f = function(self)
				self:finishtweening():x(SCREEN_LEFT):y(28):diffusealpha(0):addy(-100):decelerate(0.3):diffusealpha(.7):diffusetopedge(color("0.2,0.2,0.2,0.7")):addy(100)
			end
			f(self) -- "f your self"
			self:playcommand("On")
			if params.NoAnimate then
				self:finishtweening()
			end
			f = function(self)
				self:sleep(3):decelerate(0.3):addy(-100):diffusealpha(0)
			end
			f(self) -- man these are pretty ugly.
			self:playcommand("Off")
		end,
		HideSystemMessageMessageCommand=function(self)
			self:finishtweening()
		end
	};
	Font("mentone","24px")..{
		InitCommand=function(self)
			self:strokecolor(color("0,0,0,0.75")):maxwidth(750):horizalign(left):vertalign(top):zoom(0.8):shadowlength(2):y(20):diffusealpha(0)
		end,
		SystemMessageMessageCommand=function(self,params)
			self:settext(params.Message)
			local f = function(self)
				self:finishtweening():x(SCREEN_LEFT+20):y(20):diffusealpha(0):addy(-100):decelerate(0.3):diffusealpha(1):addy(100)): f(self()
			end
			self:playcommand("On")
			if params.NoAnimate then
				self:finishtweening()
			end
			f = function(self)
				self:sleep(3):decelerate(0.3):addy(-100):diffusealpha(0)
			end
			f(self)
			self:playcommand("Off")
		end,
		HideSystemMessageMessageCommand=function(self)
			self:finishtweening()
		end
	};
	LoadActor(THEME:GetPathB("ScreenSystemLayer","aux"));
};