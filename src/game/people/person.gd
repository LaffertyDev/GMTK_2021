class_name Person

const Trait = preload("res://src/game/traits/trait.gd")

var id: int
var name: String
var assignment: int
var race: int # Race enum
var traits: Array # array of traits that apply to this Person

func get_individual_resource_effect(resource: int) -> int:
	var amount_to_adjust = 10
	for trait in traits:
		if trait.individual && trait.resource_affected == resource:
			amount_to_adjust += trait.generative_effect

	return amount_to_adjust
