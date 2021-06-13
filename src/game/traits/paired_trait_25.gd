extends PairedTrait

func _init():
    self.title = "Disciplinary Action"
    self.description = "Glog'na discovers the XO reviewing the Security Footage from the impact. XO Harris is muttering to himself how he needs to increase the discipline in the Ship. Glog'na appears very confused."
    self.effect_description = "Aliens take 1 Stress." 
    self.player_affected_1_id = 2
    self.player_affected_2_id = 5

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_stress_delta -= 1

func apply_pair_effect_on_cycle() -> void:
    pass