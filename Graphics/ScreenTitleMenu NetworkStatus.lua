local netConnected = IsNetConnected();
local loggedOnSMO = IsNetSMOnline();

local t = Def.ActorFrame{
	LoadFont("Common Normal") .. {
		InitCommand=function(self)
			self:halign(1):zoom(0.5)
		end;
		BeginCommand=function(self)
			-- check network status
			if netConnected then
				self:diffuse( color("0.95,0.975,1,1") );
				self:diffusebottomedge( color("0.72,0.89,1,1") );
				self:settext( "Online" );
			else
				self:diffuse( color("0.75,0.75,0.75,1") );
				self:settext( "Offline" );
			end;
		end;
		OffCommand=function(self)
			self:bouncebegin(0.125):zoomy(0):zoomx(1024):addx(SCREEN_WIDTH)
		end;
	};
};

if netConnected then
	t[#t+1] = LoadFont("Common Normal") .. {
		InitCommand=function(self)
			self:y(14):halign(1):zoom(0.5):diffuse(color("0.72,0.89,1,1"))
		end;
		BeginCommand=function(self)
			self:settext( "Online" );
		end;
		OffCommand=function(self)
			self:bouncebegin(0.125):zoomy(0)
		end;
	};
end;

return t;