tower_config = require("abilities/tower/tower_config")

LinkLuaModifier("modifier_invulnerable", "modifier/modifier_invulnerable", LUA_MODIFIER_MOTION_NONE)

function createTower(ability)

    local caster = ability:GetCaster()

    local pos = caster:GetCursorPosition()

    local tower_id = ability:GetSpecialValueFor("tower_id")

    local tower_unit = CreateUnitByName(tower_config[tower_id].tower_name, pos, false, caster, caster:GetOwner(), caster:GetTeam())

    tower_unit:SetControllablePlayer(caster:GetPlayerID(), true)

    tower_unit:AddNewModifier(ability:GetCaster(), ability, "modifier_invulnerable", {})

    tower_unit.costGold = ability:GetCostGold(-1);

    return tower_unit;

end
    