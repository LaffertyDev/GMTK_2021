extends PairedTrait

func _init():
    self.title = "Oh... My... God..."
    self.description = "While listening for a Beatle, Bob discovers that Captain Andersen is stuck in the field of a nearby Power Coil! The Captain's heart quickly failing, Bob quickly envelops the Captain... fusing their conciousness."
    self.effect_description = "The Captain is Dead. Grog'na gains an aura of Command." 
    self.player_affected_1_id = 1
    self.player_affected_2_id = 7

func apply_pair_effect(_resourceManager: ResourceManager) -> void:
    pass

func apply_pair_effect_on_cycle() -> void:
    print("Kill captain and rename Bob")
    pass