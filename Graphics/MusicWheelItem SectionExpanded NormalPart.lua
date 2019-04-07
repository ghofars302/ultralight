return Def.ActorFrame {
	Def.Actor{
		Name="GroupMesageController_Exp";
		SetMessageCommand=function(self,params)
			if params.HasFocus and not params.Song then
				focusIdx = params.Index
				local displayText = params.SongGroup;
				local sectionCount = self:GetParent():GetParent():GetChild("SectionCount");
				local songs = 0;
				if sectionCount then
					songs = sectionCount:GetText();
				end;

				MESSAGEMAN:Broadcast("SectionText", { Text = displayText, Count = tonumber(songs) });
			end;
		end;
	};

	-- background stuff
	Def.Quad{
		Name="Horizontal";
		InitCommand=function(self)
			self:x(48):y(16):zoomto(SCREEN_CENTER_X,32):diffuse(color("1,1,1,0.175")):blend(Blend.Add):vertalign(bottom):fadeleft(0.25):faderight(0.5)
		end;
	};
	Def.Quad{
		Name="Vertical";
		InitCommand=function(self)
			self:x(48):y(16):zoomto(SCREEN_CENTER_X,32):diffuse(color("1,1,1,0.05")):blend(Blend.Add):vertalign(bottom):fadetop(0.85)
		end;
	};

	-- light stuff
	Def.Quad{
		InitCommand=function(self)
			self:x(-80):zoomto(8,24):diffuse(HSVA(192,0.8,1,0.5)):diffusebottomedge(HSVA(192,0.8,0.925,1))
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:x(-80):zoomto(8,24):blend(Blend.Add):diffusealpha(0.25)
		end;
		OnCommand=function(self)
			self:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.3"))
		end;
	};

	-- bottom line
	Def.Quad{
		InitCommand=function(self)
			self:x(48):y(16):zoomto(SCREEN_CENTER_X,2):diffuse(color("1,1,1,0.5")):fadeleft(0.25):faderight(0.25)
		end;
	};
};