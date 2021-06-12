class_name PairedTraitManager

const Enums = preload("res://src/game/enums.gd")
const Person = preload("res://src/game/people/person.gd")
const PairedTrait = preload("res://src/game/traits/paired_trait.gd")
const ResourceManager = preload("res://src/game/resource_manager.gd")
const PairedTraitIndividual = preload("res://src/game/traits/paired_trait_individual.gd")
const PairedTrait11 = preload("res://src/game/traits/paired_trait_12.gd")

var individual_pair_trait: PairedTrait

var trait_pairs = []

func _init():
	trait_pairs.append(PairedTrait11.new())
	individual_pair_trait = PairedTraitIndividual.new()

func get_pair_effect(person1: Person, person2: Person) -> PairedTrait:
	if person1.race == Enums.Race.Robot || person2.race == Enums.Race.Robot:
		return individual_pair_trait # no effect because robots don't pair with anyone

	for trait_pair in trait_pairs:
		if trait_pair.is_pair_for_people(person1, person2):
			return trait_pair

	return individual_pair_trait

# Applies the pair effect so the user can understand what is about to happen if they hit "Next Cycle"
#func apply_pair_effect(pairedTrait: PairedTrait, resourceManager: ResourceManager) -> void:
#func apply_pair_effect_on_cycle(pairedTrait: PairedTrait) -> void
