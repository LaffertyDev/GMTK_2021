extends PairedTrait

func _init():
    self.title = "Simple Folk Simple Taste"
    self.description = "Chief Medical Officer Kurry and Bob immediately found one thing in common: their hatred of flavour. They enjoy discussing the finer points of simple cuisine, such as why Cheese Pizza with an Appetizer of Chicken Nuggets is simply the best food in the Entire Universe."
    self.effect_description = "Aliens relieve Stress by 3, gain 2 Food" 
    self.player_affected_1_id = 4
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_stress_delta += 3
    resourceManager.human_food_delta += 2

func apply_pair_effect_on_cycle(_personManager) -> void:
    pass