extends PairedTrait

func _init():
    self.title = "Disgusting!"
    self.description = "Glog'na couldn't believe its eyes when it discovered the Chief Medical Officer elbow-deep in some Alien Waste. Glog'na was so offended it's ears briefly muted the wonderful song of the Beatles."
    self.effect_description = "Lose 3 Beatles." 
    self.player_affected_1_id = 4
    self.player_affected_2_id = 5

func apply_pair_effect(resourceManager: ResourceManager) -> void:
    resourceManager.alien_beatles_delta -= 3

func apply_pair_effect_on_cycle() -> void:
    pass