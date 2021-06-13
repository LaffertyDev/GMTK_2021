extends PairedTrait

func _init():
    self.title = "Irritant"
    self.description = "Glog'na never appreciated the Shooting Comet. And Shooting Comet never gave Glog'na the time of day. Whenever these two work together, lose 1 Beatle, lose 2 alien stress"
    self.player_affected_1_id = 5
    self.player_affected_2_id = 6

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_beatles_delta -= 1
    resourceManager.alien_stress_delta -= 2

func apply_pair_effect_on_cycle() -> void:
    pass