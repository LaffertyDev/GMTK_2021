extends PairedTrait

func _init():
    self.title = "Not the Flowers!"
    self.description = "Captain Andersen, seeing the Shooting Comet in the Hydroponics Bay, recoils and tries to stop the Creature from whatever it was it was doing."
    self.effect_description = "Aliens take 1 Stress and lose 1 Beatle, gain 5 Food."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 6

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_beatles_delta -= 1
    resourceManager.alien_stress_delta -= 1
    resourceManager.human_food_delta += 5

func apply_pair_effect_on_cycle(_personManager) -> void:
    pass