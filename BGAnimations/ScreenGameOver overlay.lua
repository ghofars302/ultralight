return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_gameover"))..{
		InitCommand=function(self)
			self:Center():diffusealpha(0)
		end,
		OnCommand=function(self)
			self:accelerate(0.75):diffusealpha(0.75):glow(color("1,1,1,1")):decelerate(1):glow(color("1,1,1,0"))
		end,
	},
}