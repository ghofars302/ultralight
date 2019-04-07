local Player = ...
assert(Player,"Must pass in a player, dingus");

local profile;
if PROFILEMAN:IsPersistentProfile(Player) then
	-- player profile
	profile = PROFILEMAN:GetProfile(Player);
else
	-- machine profile
	profile = PROFILEMAN:GetMachineProfile();
end;

return LoadFont("Common normal")..{
	InitCommand=function(self)
		self:shadowlength(0):zoom(0.75):strokecolor(color("0,0,0,0"))
	end;
	BeginCommand=function(self)
		self:visible( GAMESTATE:IsHumanPlayer(Player) );
	end;
	SetCommand=function(self)
		local text = "";
		local SongOrCourse, StepsOrTrail;
		if GAMESTATE:IsCourseMode() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
			StepsOrTrail = GAMESTATE:GetCurrentTrail(Player);
		else
			SongOrCourse = GAMESTATE:GetCurrentSong();
			StepsOrTrail = GAMESTATE:GetCurrentSteps(Player);
		end;
		if SongOrCourse then
			if StepsOrTrail then
				local scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist);
				local scores = scorelist:GetHighScores();
				local topscore = scores[1];
				text = topscore and string.format("%.2f%%", topscore:GetPercentDP()*100.0) or string.format("%.2f%%", 0);
			else
				text = string.format("%.2f%%", 0);
			end;
		else
			text = string.format("%.2f%%", 0);
		end;
		self:settext(text);
	end;
	PlayerJoinedMessageCommand=function(self,param)
		if param.Player == Player then
			self:visible(true);
		end;
	end;
	PlayerUnjoinedMessageCommand=function(self,param)
		if param.Player == Player then
			self:visible(false);
		end;
	end;
	CurrentSongChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentCourseChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentStepsP1ChangedMessageCommand=function(self)
		if Player == PLAYER_1 then self:playcommand("Set"); end;
	end;
	CurrentTrailP1ChangedMessageCommand=function(self)
		if Player == PLAYER_1 then self:playcommand("Set"); end;
	end;
	CurrentStepsP2ChangedMessageCommand=function(self)
		if Player == PLAYER_2 then self:playcommand("Set"); end;
	end;
	CurrentTrailP2ChangedMessageCommand=function(self)
		if Player == PLAYER_2 then self:playcommand("Set"); end;
	end;
};