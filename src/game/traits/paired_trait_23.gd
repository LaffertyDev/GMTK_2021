extends PairedTrait

func _init():
    self.title = "Fond of Drink"
    self.description = "Normally found together in the Mess, the Chief Engineer and the XO have been known to share their favorite drinks. No private barrel-aged Whiskey is off the table for these comrades."
    self.effect_description = "Gain 10 Water." 
    self.player_affected_1_id = 2
    self.player_affected_2_id = 3

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 10

func apply_pair_effect_on_cycle(_personManager) -> void:
    pass