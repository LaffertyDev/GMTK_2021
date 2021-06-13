extends PairedTrait

func _init():
    self.title = "The Captain and his XO"
    self.description = "Life-long friends, the Captain and the XO have journeyed on 194 Colony Tours. With many adventures comes a soothing effect."
    self.effect_description = "Relieve Human Stress by 5 when together."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 2

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_stress_delta += 5

func apply_pair_effect_on_cycle(_personManager) -> void:
    pass