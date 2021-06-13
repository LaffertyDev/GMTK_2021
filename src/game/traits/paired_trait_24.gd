extends PairedTrait

func _init():
    self.title = "What do you do with a Drunken Sailer..."
    self.description = "Found roaming the halls when they should be working, Harris and Kurry can be heard boisterously singing old maritime Sea Shanties with each other. The songs are infectious."
    self.effect_description = "Humans and Aliens relieve 5 Stress." 
    self.player_affected_1_id = 2
    self.player_affected_2_id = 4

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_stress_delta += 5
    resourceManager.alien_stress_delta -= 5

func apply_pair_effect_on_cycle(_personManager) -> void:
    pass