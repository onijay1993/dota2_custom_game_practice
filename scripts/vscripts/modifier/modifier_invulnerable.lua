modifier_invulnerable = class ({})

function modifier_invulnerable:IsDebuff()
    return false
    
end

function modifier_invulnerable:IsPurgable()
    return false
    
end

---initialization

function modifier_invulnerable:OnCreated( kv )
    
end

function modifier_invulnerable:CheckState()
    local state = {
        [MODIFIER_STATE_INVULNERABLE] = true,
    }

    return false
    
end