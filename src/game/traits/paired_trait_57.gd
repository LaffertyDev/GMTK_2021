extends PairedTrait

func _init():
    self.title = "Opposites Attract"
    self.description = "Bob and Glog'na seem insepperable... because once together it takes a significant prying force to break free from their electric bonds."
    self.effect_description = "Humans take 1 stress, generate 5 Power" 
    self.player_affected_1_id = 5
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_stress_delta -= 1
    resourceManager.alien_power_delta += 5

func apply_pair_effect_on_cycle() -> void:
    pass