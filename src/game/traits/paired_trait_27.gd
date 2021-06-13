extends PairedTrait

func _init():
    self.title = "Fresh Fruit?!"
    self.description = "Bob and XO Harris are walking down the corridor chatting pleasantries. Bob absentmindedly picks at one of his Strawberries, and the XO gets a wonderful idea involving a 200-year aged Cognac."
    self.effect_description = "Gain 5 Water, gain 5 Food." 
    self.player_affected_1_id = 2
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 5
    resourceManager.human_food_delta += 5

func apply_pair_effect_on_cycle() -> void:
    pass