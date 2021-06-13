extends PairedTrait

func _init():
    self.title = "Whistling Wonder"
    self.description = "Nothing has entertained the crew more than Bob Whistling the tune of the Beatle. Shooting Comet goes wild with energy! Whenever these two are together, generate 5 Beatles"
    self.player_affected_1_id = 6
    self.player_affected_2_id = 7

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_beatles_delta += 5

func apply_pair_effect_on_cycle() -> void:
    pass