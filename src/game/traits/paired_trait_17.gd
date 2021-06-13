extends PairedTrait

func _init():
    self.title = "Oh... My... God..."
    self.description = "While slithering for a Beatle, Bob discovers that Captain Andersen has been struck into the field of a nearby Power Coil! His heart quickly fading, Bob quickly envelops the Captain, fusing their conciousness."
    self.player_affected_1_id = 1
    self.player_affected_2_id = 7

func apply_pair_effect(_resourceManager: ResourceManager) -> void:
    pass

func apply_pair_effect_on_cycle() -> void:
    print("Kill captain and rename Bob")
    pass