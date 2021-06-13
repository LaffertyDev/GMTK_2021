extends PairedTrait

func _init():
    self.title = "Pair 36 T"
    self.description = "Paire 36 D"
    self.player_affected_1_id = 3
    self.player_affected_2_id = 6

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 100

func apply_pair_effect_on_cycle() -> void:
    pass