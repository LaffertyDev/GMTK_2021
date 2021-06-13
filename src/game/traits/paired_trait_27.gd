extends PairedTrait

func _init():
    self.title = "Fresh Fruit?!"
    self.description = "Walking down the hallway, Bob and the XO Harris are chatting pleasantries. Bob absentmindedly picks at one of his Strawberries, and the XO gets a wonderful idea with a 2163 aged Cognac. Gain +5 water, +5 food"
    self.player_affected_1_id = 2
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 5
    resourceManager.human_food_delta += 5

func apply_pair_effect_on_cycle() -> void:
    pass