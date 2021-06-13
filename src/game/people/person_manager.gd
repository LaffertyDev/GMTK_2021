class_name PersonManager

const Enums = preload("res://src/game/enums.gd")
const Person = preload("res://src/game/people/person.gd")
const TraitBuilder = preload("res://src/game/traits/trait_builder.gd")

var persons = []

func _init():
	var traitBuilder = TraitBuilder.new()
	var trait1 = []
	trait1.append(traitBuilder.build_trait(
		"Sniffer's nose"
		, "The Captain has a nose for even the most well-hid snacks"
		, Enums.TraitTypes.GENERATIVE_EFFECT
		, Enums.ShipResources.FOOD, 4))
	trait1.append(traitBuilder.build_trait(
		"Gotta Eat"
		, "Human's Gotta Eat"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.FOOD, -1))
	trait1.append(traitBuilder.build_trait(
		"Gotta Drink"
		, "Human's Gotta Drink"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.WATER, -1))
	trait1.append(traitBuilder.build_trait(
		"Stressed Out"
		, "Human's have been known to get a little stressed..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.STRESS, -1))
	persons.append(Build(1, "Captain Andersen", Enums.Race.Human, trait1, load("res://src/game/people/people_human_1.png")))

	var trait2 = []
	trait2.append(traitBuilder.build_trait(
		"A fine collection"
		, "The XO has been knows where the best drink is"
		, Enums.TraitTypes.GENERATIVE_EFFECT
		, Enums.ShipResources.WATER, 2))
	trait2.append(traitBuilder.build_trait(
		"Gotta Eat"
		, "Human's Gotta Eat"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.FOOD, -1))
	trait2.append(traitBuilder.build_trait(
		"Gotta Drink"
		, "Human's Gotta Drink"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.WATER, -1))
	trait2.append(traitBuilder.build_trait(
		"Stressed Out"
		, "Human's have been known to get a little stressed..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.STRESS, -1))
	persons.append(Build(2, "XO Harris", Enums.Race.Human, trait2, load("res://src/game/people/people_human_2.png")))

	var trait3 = []
	trait3.append(traitBuilder.build_trait(
		"Mind of Numbers"
		, "Emily is well-versed in Power and Power generation"
		, Enums.TraitTypes.GENERATIVE_EFFECT
		, Enums.ShipResources.POWER, 2))
	trait3.append(traitBuilder.build_trait(
		"Gotta Eat"
		, "Human's Gotta Eat"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.FOOD, -1))
	trait3.append(traitBuilder.build_trait(
		"Gotta Drink"
		, "Human's Gotta Drink"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.WATER, -1))
	trait3.append(traitBuilder.build_trait(
		"Stressed Out"
		, "Human's have been known to get a little stressed..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.STRESS, -1))
	persons.append(Build(3, "Chief Engineer Emily", Enums.Race.Human, trait3, load("res://src/game/people/people_human_3.png")))

	var trait4 = []
	trait4.append(traitBuilder.build_trait(
		"There is no spoon"
		, "Kurry is a calming presence to those around him"
		, Enums.TraitTypes.GENERATIVE_EFFECT
		, Enums.ShipResources.STRESS, 2))
	trait4.append(traitBuilder.build_trait(
		"Gotta Eat"
		, "Human's Gotta Eat"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.FOOD, -1))
	trait4.append(traitBuilder.build_trait(
		"Gotta Drink"
		, "Human's Gotta Drink"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.WATER, -1))
	trait4.append(traitBuilder.build_trait(
		"Stressed Out"
		, "Human's have been known to get a little stressed..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.STRESS, -1))
	persons.append(Build(4, "Medical Officer Kurry", Enums.Race.Human, trait4, load("res://src/game/people/people_human_4.png")))

	var trait5 = []
	trait5.append(traitBuilder.build_trait(
		"Power beacon?"
		, "Glog'na appears to attach itself to nearby Power Conduits"
		, Enums.TraitTypes.GENERATIVE_EFFECT
		, Enums.ShipResources.POWER, 2))
	trait5.append(traitBuilder.build_trait(
		"Power Hungry"
		, "The Alien's appear to siphoning some power..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.POWER, -1))
	trait5.append(traitBuilder.build_trait(
		"Song of my People"
		, "The alure of the Beatle"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.BEATLES, -1))
	trait5.append(traitBuilder.build_trait(
		"Time Bomb"
		, "The Alien's appear to siphoning some power..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.STRESS, -1))
	persons.append(Build(5, "Glog'na", Enums.Race.Alien, trait5, load("res://src/game/people/people_alien_1.png")))

	var trait6 = []
	trait6.append(traitBuilder.build_trait(
		"Hunter's Ears"
		, "Shooting Comet moves erratically; hunting for the exotic beatles"
		, Enums.TraitTypes.GENERATIVE_EFFECT
		, Enums.ShipResources.BEATLES, 3))
	trait6.append(traitBuilder.build_trait(
		"Inconsiderate"
		, "While on the hunt, the Shooting Comet has been known to consume leftovers on the ground"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.FOOD, -1))
	trait6.append(traitBuilder.build_trait(
		"Power Hungry"
		, "The Alien's appear to siphoning some power..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.POWER, -1))
	trait6.append(traitBuilder.build_trait(
		"Song of my People"
		, "The alure of the Beatle"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.BEATLES, -1))
	trait6.append(traitBuilder.build_trait(
		"Time Bomb"
		, "The Alien's appear to siphoning some power..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.STRESS, -1))
	persons.append(Build(6, "Shooting Comet", Enums.Race.Alien, trait6, load("res://src/game/people/people_alien_2.png")))

	var trait7 = []
	trait7.append(traitBuilder.build_trait(
		"Friendly Glutton"
		, "Bob appears to have fresh Strawberries growing off of him!"
		, Enums.TraitTypes.GENERATIVE_EFFECT
		, Enums.ShipResources.FOOD, 15))
	trait7.append(traitBuilder.build_trait(
		"Power Hog"
		, "Bob appears absolutely ravenous for power"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.POWER
		, -15))
	trait7.append(traitBuilder.build_trait(
		"Song of my People"
		, "The alure of the Beatle"
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.BEATLES, -1))
	trait7.append(traitBuilder.build_trait(
		"Time Bomb"
		, "The Alien's appear to siphoning some power..."
		, Enums.TraitTypes.NEED
		, Enums.ShipResources.STRESS, -1))
	persons.append(Build(7, "Bob", Enums.Race.Alien, trait7, load("res://src/game/people/people_alien_3.png")))

	var trait8 = []
	persons.append(Build(8, "Robot XAEA-XII", Enums.Race.Robot, trait8, load("res://src/game/people/people_robot_1.png")))

	var trait9 = []
	persons.append(Build(9, "Robot Sunny", Enums.Race.Robot, trait9, load("res://src/game/people/people_robot_1.png")))

func get_person_by_id(id: int) -> Person:
	for person in persons:
		if (person.id == id):
			return person
	
	return null

static func Build(_id: int, _name: String, _race: int, _traits: Array, _texture: Texture) -> Person:
	var person = Person.new()
	person.id = _id
	person.name = _name
	person.assignment = -1
	person.race = _race
	person.traits = _traits
	person.texture = _texture
	return person

func unassign_person(person: Person) -> void:
	person.assignment = -1

func assign_person(person: Person, assignment: int) -> void:
	person.assignment = assignment

func get_unassigned_persons() -> Person:
	var unassigned_persons = []
	for person in persons:
		if person.assignment == -1:
			unassigned_persons.append(person)
	return unassigned_persons

func get_persons_assigned_to(assignment: int) -> Array:
	var assigned_to_job = []
	for person in persons:
		if person.assignment == assignment:
			assigned_to_job.append(person)
	return assigned_to_job
