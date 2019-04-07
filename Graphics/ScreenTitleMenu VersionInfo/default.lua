return Def.ActorFrame{
	LoadActor("_arrow")..{
		InitCommand=function(self)
			self:y(-32)
		end;
		OffCommand=function(self)
			self:linear(0.25):rotationz(-45):sleep(0.1):accelerate(0.25):addy(-SCREEN_HEIGHT)
		end;
	};
	LoadActor("_fill")..{
		InitCommand=function(self)
			self:y(-32)
		end;
		BeginCommand=function(self)
			local fillColor;
			local alpha = 0.5;
			self:blend(Blend.Add);

			-- check version
			if is_sm_ssc then
				-- sm-ssc
				fillColor = HSVA(32,1,1,alpha);
			elseif is_freemSM then
				fillColor = HSVA(212,0.5,0.333,alpha);
			else
				-- StepMania 5
				fillColor = HSVA(0,1,1,alpha);
			end;
			self:diffuse(fillColor);
		end;
		OffCommand=function(self)
			self:linear(0.25):rotationz(-45):sleep(0.1):accelerate(0.25):addy(-SCREEN_HEIGHT)
		end;
	};
	Font("mentone","24px")..{
		InitCommand=function(self)
			self:shadowlength(1):zoom(0.75):y(6):NoStroke()
		end;
		BeginCommand=function(self)
			local progtext = ProductID()
			if ProductFamily() ~= nil then
				progtext = ProductFamily()
			end
			self:settext(progtext)
		end;
		OffCommand=function(self)
			self:linear(0.25):zoomx(0)
		end;
	};
	Font("mentone","24px")..{
		Text=ProductVersion();
		InitCommand=function(self)
			self:shadowlength(1):zoom(0.5):y(22):NoStroke()
		end;
		OffCommand=function(self)
			self:linear(0.25):zoomx(0)
		end;
	};
	Font("mentone","24px")..{
		Text=VersionDate().." @ "..VersionTime();
		InitCommand=function(self)
			self:shadowlength(1):zoom(0.4):y(34):NoStroke()
		end;
		OffCommand=function(self)
			self:linear(0.25):zoomy(0)
		end;
	};
};