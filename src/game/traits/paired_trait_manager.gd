class_name PairedTraitManager

const Enums = preload("res://src/game/enums.gd")
const Person = preload("res://src/game/people/person.gd")
const PairedTrait = preload("res://src/game/traits/paired_trait.gd")
const ResourceManager = preload("res://src/game/resource_manager.gd")

const PairedTrait12 = preload("res://src/game/traits/paired_trait_12.gd")
const PairedTrait13 = preload("res://src/game/traits/paired_trait_13.gd")
const PairedTrait14 = preload("res://src/game/traits/paired_trait_14.gd")
const PairedTrait15 = preload("res://src/game/traits/paired_trait_15.gd")
const PairedTrait16 = preload("res://src/game/traits/paired_trait_16.gd")
const PairedTrait17 = preload("res://src/game/traits/paired_trait_17.gd")

const PairedTrait23 = preload("res://src/game/traits/paired_trait_23.gd")
const PairedTrait24 = preload("res://src/game/traits/paired_trait_24.gd")
const PairedTrait25 = preload("res://src/game/traits/paired_trait_25.gd")
const PairedTrait26 = preload("res://src/game/traits/paired_trait_26.gd")
const PairedTrait27 = preload("res://src/game/traits/paired_trait_27.gd")

const PairedTrait34 = preload("res://src/game/traits/paired_trait_34.gd")
const PairedTrait35 = preload("res://src/game/traits/paired_trait_35.gd")
const PairedTrait36 = preload("res://src/game/traits/paired_trait_36.gd")
const PairedTrait37 = preload("res://src/game/traits/paired_trait_37.gd")

const PairedTrait45 = preload("res://src/game/traits/paired_trait_45.gd")
const PairedTrait46 = preload("res://src/game/traits/paired_trait_46.gd")
const PairedTrait47 = preload("res://src/game/traits/paired_trait_47.gd")

const PairedTrait56 = preload("res://src/game/traits/paired_trait_56.gd")
const PairedTrait57 = preload("res://src/game/traits/paired_trait_57.gd")

const PairedTrait67 = preload("res://src/game/traits/paired_trait_67.gd")

var trait_pairs = []

func _init():
	trait_pairs.append(PairedTrait12.new())
	trait_pairs.append(PairedTrait13.new())
	trait_pairs.append(PairedTrait14.new())
	trait_pairs.append(PairedTrait15.new())
	trait_pairs.append(PairedTrait16.new())
	trait_pairs.append(PairedTrait17.new())

	trait_pairs.append(PairedTrait23.new())
	trait_pairs.append(PairedTrait24.new())
	trait_pairs.append(PairedTrait25.new())
	trait_pairs.append(PairedTrait26.new())
	trait_pairs.append(PairedTrait27.new())

	trait_pairs.append(PairedTrait34.new())
	trait_pairs.append(PairedTrait35.new())
	trait_pairs.append(PairedTrait36.new())
	trait_pairs.append(PairedTrait37.new())

	trait_pairs.append(PairedTrait45.new())
	trait_pairs.append(PairedTrait46.new())
	trait_pairs.append(PairedTrait47.new())

	trait_pairs.append(PairedTrait56.new())
	trait_pairs.append(PairedTrait57.new())

	trait_pairs.append(PairedTrait67.new())

func get_pair_effect(person1: Person, person2: Person) -> PairedTrait:
	if person1.race == Enums.Race.Robot || person2.race == Enums.Race.Robot:
		return null # no effect because robots don't pair with anyone

	for trait_pair in trait_pairs:
		if trait_pair.is_pair_for_people(person1, person2):
			return trait_pair

	return null

# Applies the pair effect so the user can understand what is about to happen if they hit "Next Cycle"
#func apply_pair_effect(pairedTrait: PairedTrait, resourceManager: ResourceManager) -> void:
#func apply_pair_effect_on_cycle(pairedTrait: PairedTrait) -> void
