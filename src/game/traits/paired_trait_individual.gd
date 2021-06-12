extends PairedTrait

func _init():
    self.title = "I am an individual"
    self.description = "I am an individual description!!!!!"
    self.player_affected_1_id = -1
    self.player_affected_2_id = -1

func apply_pair_effect(_resourceManager: ResourceManager) -> void:
    pass # individuals do nothing

func apply_pair_effect_on_cycle() -> void:
    pass