extends PairedTrait

func _init():
    self.title = "Good Boy!"
    self.description = "Love at first sight. So adorable! Shooting Comet immediately took to the Chief Engineer; showering her with hunted findings. When together, Aliens and Humans lose 2 stress and gain 2 food."
    self.effect_description = "Humans and Aliens relieve 2 Stress, gain 2 Food" 
    self.player_affected_1_id = 3
    self.player_affected_2_id = 6

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_stress_delta += 2
    resourceManager.alien_stress_delta += 2
    resourceManager.human_food_delta += 2

func apply_pair_effect_on_cycle(_personManager) -> void:
    pass