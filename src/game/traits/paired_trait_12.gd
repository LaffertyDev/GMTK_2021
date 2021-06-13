extends PairedTrait

func _init():
    self.title = "The Captain and his XO"
    self.description = "Life-long friends, the Captain and the XO have journey on 194 Colony Tours. When they work together, they relieve stress."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 2

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_stress_delta += 5

func apply_pair_effect_on_cycle() -> void:
    pass