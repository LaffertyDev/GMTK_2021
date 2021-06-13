extends PairedTrait

func _init():
    self.title = "Sparky"
    self.description = "The Chief and Glog'na had initially gotten off on the wrong foot. But the Power Readings from Glog'na are hard to argue with."
    self.effect_description = "Generate 15 Power." 
    self.player_affected_1_id = 3
    self.player_affected_2_id = 5

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_power_delta += 15

func apply_pair_effect_on_cycle() -> void:
    pass