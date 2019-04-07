return LoadFont("Common normal") .. {
	InitCommand=function(self)
		self:zoom(0.425):y(-3):shadowlength(1):strokecolor(color("#00000033"))
	end;
};