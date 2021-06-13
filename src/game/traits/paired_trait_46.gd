extends PairedTrait

func _init():
    self.title = "Friends"
    self.description = "The Chief Medical Officer shows the Shooting Comet around his office. Shooting Comet notices a strange still-creature on his desk and becomes completely enraptured."
    self.effect_description = "Humans and Aliens relieve 3 Stress" 
    self.player_affected_1_id = 4
    self.player_affected_2_id = 6

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_stress_delta += 2
    resourceManager.human_stress_delta += 2

func apply_pair_effect_on_cycle() -> void:
    pass