extends PairedTrait

func _init():
    self.title = "Simple Folk Simple Taste"
    self.description = "Chief Medical Officer Kurry and Bob immediately found one thing in common: their hatred of flavour. They enjoy discussing the finer points of simple cuisine, such as why Cheese Pizza with an Appetizer of Chicken Nuggets is simply the best food in the Entire Universe. Bob agrees. Whenever Kurry and Bob are together, Aliens gain 3 stress and generate 5 food"
    self.player_affected_1_id = 4
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 100

func apply_pair_effect_on_cycle() -> void:
    pass