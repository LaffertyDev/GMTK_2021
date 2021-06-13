extends PairedTrait

func _init():
    self.title = "Medical Override"
    self.description = "Medical Officer Kurry has been concerned about the Captain's Health ever since the Vega incident."
    self.effect_description = "Humans take 1 Stress."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 4

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.human_stress_delta -= 1

func apply_pair_effect_on_cycle(_personManager) -> void:
    pass