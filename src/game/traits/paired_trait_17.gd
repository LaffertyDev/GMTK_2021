extends PairedTrait

const Enums = preload("res://src/game/enums.gd")
const TraitBuilder = preload("res://src/game/traits/trait_builder.gd")

func _init():
	self.title = "Oh... My... God..."
	self.description = "While listening for a Beatle, Bob discovers that Captain Andersen is stuck in the field of a nearby Power Coil! The Captain's heart quickly failing, Bob quickly envelops the Captain... fusing their conciousness."
	self.effect_description = "The Captain is Dead. Grog'na gains an aura of Command." 
	self.player_affected_1_id = 1
	self.player_affected_2_id = 7

func apply_pair_effect(_resourceManager: ResourceManager) -> void:
	pass

func apply_pair_effect_on_cycle(personManager) -> void:
	var traitBuilder = TraitBuilder.new()
	personManager.persons.remove(0)
	var bob = personManager.get_person_by_id(7)
	bob.name = "Captain Bob"
	bob.traits.append(traitBuilder.build_trait(
		"Leadership Aura"
		, "Bob has a commanding presence... (+30 Power)"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.POWER, 30))
	bob.traits.append(traitBuilder.build_trait(
		"Leadership Aura"
		, "Bob has a commanding presence... (+30 Food)"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.FOOD, 30))
	bob.traits.append(traitBuilder.build_trait(
		"Leadership Aura"
		, "Bob has a commanding presence... (+30 Water)"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.WATER, 30))
	bob.traits.append(traitBuilder.build_trait(
		"Leadership Aura"
		, "Bob has a commanding presence... (+30 Beatles)"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.BEATLES, 30))