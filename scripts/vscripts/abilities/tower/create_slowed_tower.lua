create_slowed_tower = ({})

require("abilities/tower/a_create_base_tower")
require("modifier/modifier_slow")


function create_slowed_tower:OnSpellStart()

    local tower = createTower(self)

end