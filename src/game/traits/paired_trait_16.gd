extends PairedTrait

func _init():
    self.title = "Not the Flowers!"
    self.description = "Captain Andersen, seeing the Shooting Comet in the Hydroponics Bay, recoils and tries to stop the Creature from whatever it was they were doing. The Aliens gain one stress and lose one Beatle, gain 5 food."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 6

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_beatles_delta -= 1
    resourceManager.alien_stress_delta -= 1
    resourceManager.human_food_delta += 5

func apply_pair_effect_on_cycle() -> void:
    pass