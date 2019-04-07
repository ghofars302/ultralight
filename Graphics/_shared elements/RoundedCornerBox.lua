-- code adapted from shakesoda's optical
local Width, Height, Color = ...
assert(Width);
assert(Height);
local corner = "_corner"; -- graphic file
local DefaultColor = color("0,0,0,1"); -- black box omg magic

-- Color is optional.
if not Color then Color = DefaultColor end;

--[[
How it's drawn:
  c----c
  OOOOOO
  c----c

---- is 8px tall and Width-8 wide. y = (Height/2), flip the bit.
OOOO is Height-8px tall and Width wide.
c's x position is Width - 4, flip the bit if needed.
--]]
local EdgeWidth = Width-8;
local EdgePosY = (Height/2);
local CornerPosX = ((Width/2)-4);

return Def.ActorFrame{
	-- top
	
	Def.Quad {
		 InitCommand=function(self)
			self:zoomto(EdgeWidth-8,8):y(-EdgePosY)
		end
	};
	-- middle
	
	Def.Quad {
		 InitCommand=function(self)
			self:zoomto(Width,Height-8)
		end
	};
	-- bottom
	
	Def.Quad {
		 InitCommand=function(self)
			self:zoomto(EdgeWidth-8,8):y(EdgePosY)
		end
	};
	 -- top left
	
	LoadActor(corner)..{
		 InitCommand=function(self)
			self:x(-CornerPosX):y(-EdgePosY)
		end
	};
	 -- top right
	
	LoadActor(corner)..{
		 InitCommand=function(self)
			self:x(CornerPosX):y(-EdgePosY):rotationz(90)
		end
	};
	 -- bottom left
	
	LoadActor(corner)..{
		 InitCommand=function(self)
			self:x(-CornerPosX):y(EdgePosY):rotationz(-90)
		end
	};
	 -- bottom right
	
	LoadActor(corner)..{
		 InitCommand=function(self)
			self:x(CornerPosX):y(EdgePosY):rotationz(180)
		end
	};
};