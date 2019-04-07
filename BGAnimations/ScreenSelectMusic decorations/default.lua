local t = Def.ActorFrame{
	-- lol the things I have to hack in to fix StepMania's oversights (and yes,
	-- this fix applies to sm-ssc v1.0 beta 2 [also beta 3, likely] as well.)
	Def.Actor{
		Name="FixerUpper";
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			for pn in ivalues(PlayerNumber) do
				local score = SCREENMAN:GetTopScreen():GetChild("Score"..ToEnumShortString(pn));
				if score and not song then
					score:settext("        0");
				end;
			end;
		end;
	};
};

t[#t+1] = StandardDecorationFromFile("ArtistAndGenre","ArtistAndGenre");
t[#t+1] = StandardDecorationFromFile("BPMDisplay","BPMDisplay");
t[#t+1] = StandardDecorationFromFileOptional("SortDisplay","SortDisplay");
t[#t+1] = StandardDecorationFromFileOptional("SelectionLength","SelectionLength");
t[#t+1] = StandardDecorationFromFileOptional("SongOptions","SongOptions");
t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
t[#t+1] = StandardDecorationFromFileOptional("CourseContentsList","CourseContentsList");

-- todo: optimize heavily
if not GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.StepsDisplayList {
		Name="StepsDisplayList";
		InitCommand=function(self)
			self:xy((SCREEN_CENTER_X*0.75/2)+28,SCREEN_CENTER_Y*1.275)
		end;
		OffCommand=function(self)
			self:bouncebegin(0.375):addx(-SCREEN_CENTER_X*1.25)
		end;
		CurrentSongChangedMessageCommand=function(self)
			self:visible(GAMESTATE:GetCurrentSong() ~= nil);
		end;
		CursorP1 = Def.ActorFrame {
			BeginCommand=function(self)
				self:visible(true)
			end;
			StepsSelectedMessageCommand=function( self, param ) 
				if param.Player ~= "PlayerNumber_P1" then return end;
				self:visible(false);
			end;
			children={
				LoadActor( "StepsDisplayList highlight" ) .. {
					InitCommand=function(self)
						self:addx(-10):diffusealpha(0.3)
					end;
					BeginCommand=function(self)
						self:player("PlayerNumber_P1")
					end;
					OnCommand=function(self)
						self:playcommand("UpdateAlpha")
					end;
					CurrentStepsP1ChangedMessageCommand=function(self)
						self:playcommand("UpdateAlpha")
					end;
					CurrentStepsP2ChangedMessageCommand=function(self)
						self:playcommand("UpdateAlpha")
					end;
					UpdateAlphaCommand=function(self)
						local s1 = GAMESTATE:GetCurrentSteps(PLAYER_1);
						local s2 = GAMESTATE:GetCurrentSteps(PLAYER_2);
						self:stoptweening();
						if not s1 or not s2 or s1:GetDifficulty() == s2:GetDifficulty() then
							self:linear(.08);
							self:diffusealpha(0.15);
						else
							self:linear(.08); --has no effect if alpha is already .3
							self:diffusealpha(0.3);
						end;
					end;
					PlayerJoinedMessageCommand=function(self,param )
						if param.Player ~= "PlayerNumber_P1" then return end;
						self:visible( true );
					end;
				};
				Def.ActorFrame {
					InitCommand=function(self)
						self:x(-130)
					end;
					children={
						Font("mentone","24px") .. {
							InitCommand=function(self)
								self:y(-3):settext("P1"):diffuse(PlayerColor("PlayerNumber_P1")):shadowlength(1):zoom(0.5):shadowcolor(color("#00000044")):NoStroke()
							end;
							BeginCommand=function(self)
								self:player("PlayerNumber_P1")
							end;
							PlayerJoinedMessageCommand=function(self,param )
								if param.Player ~= "PlayerNumber_P1" then return end;
								self:visible( true );
							end;
						};
					}
				};
			};
		};
		CursorP2 = Def.ActorFrame {
			BeginCommand=function(self)
				self:visible(true)
			end;
			StepsSelectedMessageCommand=function( self, param ) 
				if param.Player ~= "PlayerNumber_P2" then return end;
				self:visible(false);
			end;
			children={
				LoadActor( "StepsDisplayList highlight" ) .. {
					InitCommand=function(self)
						self:addx(-10):zoomx(-1):diffusealpha(0.3)
					end;
					BeginCommand=function(self)
						self:player("PlayerNumber_P2")
					end;
					OnCommand=function(self)
						self:playcommand("UpdateAlpha")
					end;
					CurrentStepsP1ChangedMessageCommand=function(self)
						self:playcommand("UpdateAlpha")
					end;
					CurrentStepsP2ChangedMessageCommand=function(self)
						self:playcommand("UpdateAlpha")
					end;
					UpdateAlphaCommand=function(self)
						local s1 = GAMESTATE:GetCurrentSteps(PLAYER_1);
						local s2 = GAMESTATE:GetCurrentSteps(PLAYER_2);
						self:stoptweening();
						if not s1 or not s2 or s1:GetDifficulty() == s2:GetDifficulty() then
							self:linear(.08);
							self:diffusealpha(0.15);
						else
							self:linear(.08); --has no effect if alpha is already .3
							self:diffusealpha(0.3);
						end;
					end;
					PlayerJoinedMessageCommand=function(self,param )
						if param.Player ~= "PlayerNumber_P2" then return end;
						self:visible( true );
					end;
				};
				Def.ActorFrame {
					InitCommand=function(self)
						self:x(-127)
					end;
					children={
						Font("mentone","24px") .. {
							InitCommand=function(self)
								self:y(3):settext("P2"):diffuse(PlayerColor("PlayerNumber_P2")):shadowlength(1):zoom(0.5):shadowcolor(color("#00000044")):NoStroke()
							end;
							BeginCommand=function(self)
								self:player("PlayerNumber_P2")
							end;
							PlayerJoinedMessageCommand=function(self,param )
								if param.Player ~= "PlayerNumber_P2" then return end;
								self:visible( true );
							end;
						};
					}
				};
			}
		};
		CursorP1Frame = Def.Actor{ };
		CursorP2Frame = Def.Actor{ };
	};
end

--for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
for pn in ivalues(PlayerNumber) do
	local PaneDisplay = LoadActor( THEME:GetPathG( Var "LoadingScreen", "PaneDisplay" ), pn );
	t[#t+1] = StandardDecorationFromTable( "PaneDisplay" .. ToEnumShortString(pn), PaneDisplay );

	-- todo: don't show these two in course mode?
	local PercentScore = LoadActor( THEME:GetPathG( Var "LoadingScreen", "PercentScore" ), pn );
	t[#t+1] = StandardDecorationFromTable( "PercentScore" .. ToEnumShortString(pn), PercentScore );

	local Grade = LoadActor( THEME:GetPathG( Var "LoadingScreen", "Grade" ), pn );
	t[#t+1] = StandardDecorationFromTable( "Grade" .. ToEnumShortString(pn), Grade );
end

return t;