extends PairedTrait

func _init():
    self.title = "What are you?!"
    self.description = "Glog'na tells the Captain that he really should shower more often. The Captain, realizing this chance for Diplomacy, agrees. Nothing beats a hot shower."
    self.effect_description = "Humans and Aliens reduce Stress by 1, lose 3 Water."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 5

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 3
    resourceManager.human_stress_delta += 1
    resourceManager.alien_stress_delta += 1

func apply_pair_effect_on_cycle() -> void:
    pass