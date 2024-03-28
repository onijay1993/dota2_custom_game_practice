slowed_area = ({})

require("modifier/modifier_slowed_area")
require("modifier/modifier_slow")


LinkLuaModifier("modifier_slowed_area", "modifier/modifier_slowed_area", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifer_slow", "modifier/slow", LUA_MODIFIER_MOTION_NONE)

function slowed_area:GetIntrinsicModifierName()
    return "modifier_slowed_area"
end