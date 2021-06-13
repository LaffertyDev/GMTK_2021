extends PairedTrait

func _init():
    self.title = "Pair 67 T"
    self.description = "Paire 67 D"
    self.player_affected_1_id = 6
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 100

func apply_pair_effect_on_cycle() -> void:
    pass