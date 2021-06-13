extends PairedTrait

func _init():
    self.title = "Emily and Andersen"
    self.description = "Chief Engineer Emily was never quite sure what to think about the Captain, but over time she's warmed up and he's learned to trust her instincts. When they work together, they generate an extra 2 power and 2 food."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 3

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_food_delta += 2
    resourceManager.alien_power_delta += 2

func apply_pair_effect_on_cycle() -> void:
    pass