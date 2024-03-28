modifier_slow = class ({})

function modifier_slow:IsDebuff()
    if self:GetCaster():GetTeamNumber() ~= self:GetParent():GetTeamNumber() then
        return true
    end
    return false
    
end

function modifier_slow:OnCreated( kv )
    self.slow_percentage = kv.slow_percentage
    
end

function modifier_slow:OnRefresh( kv )
    self.slow_percentage = kv.slow_percentage
    
end

function modifier_slow:DeclareFunction()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_BONUNS_PERCENTAGE,
    }
    return funcs
    
end

function modifier_slow:GetModifierMoveSpeedBonus_Percentage( params )
    return -self.slow_percentage
end

function modifier_slow:GetEffectName()
    return "models/items/razor/razor_arcana/debut/particles/razor_arcana_debut_strike_top_lightning_strike.vpcf"
    
end
