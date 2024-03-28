modifier_slowed_area = class({})


function modifier_slowed_area: IsDebuff()
    return false
end

function modifier_slowed_area: OnCreated( kv )
    self.slow_radius = self:GetAbility():GetSpecialValueFor("slow_radius")
    self.slow_percentage = self:GetAbility():GetSpecialValueFor("slow_percentage")
    self.slow_time = self:GetAbility():GetSpecialValueFor("slow_time")

end

function modifier_slowed_area:OnRefresh( kv )
    self.slow_radius = self:GetAbility():GetSpecialValueFor("slow_radius")
    self.slow_percentage = self:GetAbility():GetSpecialValueFor("slow_percentage")
    self.slow_time = self:GetAbility():GetSpecialValueFor("slow_time")
    
end

function modifier_slowed_area:DeclareFunction()
    local funcs = {
        MODIFIER_EVENT_ON_ATTACK_LANDED,
    }
    return funcs
    
end
    

function modifier_slowed_area:OnAttackLanded( params )
    local hTarget = params.target;
    local caster = params.attacker;

    if caster ~= self:GetCaster() then return end
    hTarget:AddNewModifier(caster, self:GetAbility(), "modifier_slow", {duration = self.slow_time, slow_percentage = self.slow_percentage})

    local enemies = FindUnitsInRadius(self:GetAbility():GetAbilityTargetTeam(), hTarget:GetOrigin(), hTarget, self.slow_radius, self:GetAbility():GetAbilityTargetTeam(), DOTA_UNIT_TARGET_ALL, 0, 0, false)
    

    if #enemies > 0 then 
        local damageTable = {
            attacker = caster,
            damage = params.damage,
            damage_type = params.damage_type,
            ability = self:GetAbility(),
            damage_flags = params.damage_flag,
        }
        for _,enemy in pairs(enemies) do 
            if enemy ~= nil and enemy ~= hTarget then
                enemy:AddNewModifier(caster, self:GetAbility(), "modifier_slow", {duration = self.slow_time, slow_percentage = self.slow_percentage})
                damageTable.victim = enemy
                ApplyDamage (damageTable)
            end
        end
    end
end