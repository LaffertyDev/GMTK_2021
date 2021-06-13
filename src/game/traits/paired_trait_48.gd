extends PairedTrait

func _init():
    self.title = "Pair 48 T"
    self.description = "Paire 48 D"
    self.player_affected_1_id = 4
    self.player_affected_2_id = 8

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 100

func apply_pair_effect_on_cycle() -> void:
    pass