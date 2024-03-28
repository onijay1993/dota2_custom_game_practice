create_attack_tower = ({})

require("abilities/tower/a_create_base_tower")

function create_attack_tower:OnSpellStart()

    local tower = createTower(self)

end
