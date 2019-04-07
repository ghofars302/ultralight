local time = ...
assert(time)
return Def.ActorFrame{
	
	Def.Actor{
		 OnCommand=function(self)
			self:sleep(time)
		end
	};
};