sale_tower = ({})

function sale_tower:OnSpellStart()
    local caster = self:GetCaster();

    --return gold
    local costGold = caster.costGold;
    costGold = costGold*self:GetSpecialValueFor("goldRate")*0.01
    print(caster:GetOwner():GetPlayerID(), costGold)
        PlayerResource:ModifyGold(caster:GetOwner():GetPlayerID(), costGold, false, DOTA_ModifyGold_SellItem)

    --remove unit
    UTIL_Remove(caster)
end