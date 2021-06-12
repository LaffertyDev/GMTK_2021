extends PairedTrait

func _init():
    self.title = "I am a title!"
    self.description = "I am a description!!!!!"
    self.player_affected_1_id = 1
    self.player_affected_2_id = 2

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 100

func apply_pair_effect_on_cycle() -> void:
    pass