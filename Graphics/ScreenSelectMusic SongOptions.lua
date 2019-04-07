return Font("mentone", "24px")..{
	InitCommand=function(self)
		self:shadowlength(0):halign(0):zoom(0.5)
	end;
	BeginCommand=function(self)
		self:playcommand("Set")
	end;

	SetCommand=function(self)
		local sText = GAMESTATE:GetSongOptionsString()
		self:settext( sText )
		--[[
		if GAMESTATE:IsAnExtraStage() then
			self:diffuseblink()
		else
			self:stopeffect()
		end
		--]]
	end;
	SongOptionsChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
};