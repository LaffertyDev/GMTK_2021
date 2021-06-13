extends PairedTrait

func _init():
    self.title = "I can fix that"
    self.description = "Chief Engineer Emily looks over Bob's electrical slime readings. After applying a thin Geomagnasic Coating, Bob's Power siphoning decreased significantly."
    self.effect_description = "Generate 13 Power." 
    self.player_affected_1_id = 3
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_power_delta += 13

func apply_pair_effect_on_cycle() -> void:
    pass