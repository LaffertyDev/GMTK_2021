extends PairedTrait

func _init():
    self.title = "What are you?!"
    self.description = "Glog'na acosts of the Captain that he really should shower more often. The Captain, realizing this chance for Diplomacy, agrees. Whenever the Captain and Glog'na work together, lose 3 water and each species loses 1 stress."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 5

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_water_delta += 3
    resourceManager.human_stress_delta += 1
    resourceManager.alien_stress_delta += 1

func apply_pair_effect_on_cycle() -> void:
    pass