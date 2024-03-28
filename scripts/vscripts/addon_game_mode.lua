
-- Generated from template

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()

	
	print( "Template addon is loaded." )

	
	self.iDesiredRadiant = 2
	self.iDesiredDire = 2
	GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, self.iDesiredRadiant)
	GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, self.iDesiredDire)
	GameRules:SetHeroSelectionTime(40)

	--for i = 1,200 do
	--	print(i, DOTAGameManager:GetHeroNameByID(i))
	--end

	GameRules:GetGameModeEntity():SetThink("createMonster", self)
	monsterCount = 100
end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )


	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

function CAddonTemplateGameMode:createMonster()
	if monsterCount then 
		local path_ent = Entities:FindByName(nil, "path_monster_start")

		local mob = CreateUnitByName("npc_dota_creature_gnoll_assassin", path_ent:GetOrigin(), false, nil, nil, DOTA_TEAM_BADGUYS)

		mob:SetMustReachEachGoalEntity(true)

		mob:SetInitialGoalEntity(path_ent)

		monsterCount = monsterCount -1
	else 
		return nil
	end 

	return 2

end