extends PairedTrait

func _init():
    self.title = "Stuff You!"
    self.description = "The two Chiefs can be heard throughout the ship shouting obscenities at each other. Long rivals, they have been caught arguing about the latest scientific papers around Neuro-generative Bio-elastic Plating applications."
    self.effect_description = "Humans take 5 Stress." 
    self.player_affected_1_id = 3
    self.player_affected_2_id = 4

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_stress_delta -= 5

func apply_pair_effect_on_cycle(_personManager) -> void:
    pass