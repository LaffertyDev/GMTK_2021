extends PairedTrait

func _init():
    self.title = "Opposites Attract"
    self.description = "Bob and Glog'na seem insepperable... because once together it takes significant prying to break free from their magnetic bonds. Whenever these two are together, increase human stress by 1 and power by 5"
    self.player_affected_1_id = 5
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_stress_delta -= 1
    resourceManager.alien_power_delta += 5

func apply_pair_effect_on_cycle() -> void:
    pass