extends PairedTrait

func _init():
    self.title = "Where did you go?!"
    self.description = "The XO was starting to play one of the 'new' Holo-Games with Shooting Comet when suddenly the Alien leaps into a Vent! The XO searches for hours and finally finds Shooting Comet three corridors down playfully singing to a Beatle. Gain +3 beatles, Humans gain 1 stress."
    self.player_affected_1_id = 2
    self.player_affected_2_id = 6

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_beatles_delta += 3
    resourceManager.human_stress_delta -= 1

func apply_pair_effect_on_cycle() -> void:
    pass