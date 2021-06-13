class_name PersonManager

const Enums = preload("res://src/game/enums.gd")
const Person = preload("res://src/game/people/person.gd")
const TraitBuilder = preload("res://src/game/traits/trait_builder.gd")
	
var persons = []

func _init():
	var traitBuilder = TraitBuilder.new()
	persons.append(Build(1, "Human 1", Enums.Race.Human, [traitBuilder.build_trait("t", "d", Enums.TraitTypes.GENERATIVE_EFFECT, Enums.ShipResources.WATER, 1)], load("res://src/game/people/people_human_1.png")))
	persons.append(Build(2, "Human 2", Enums.Race.Human, [], load("res://src/game/people/people_human_2.png")))
	persons.append(Build(3, "Human 3", Enums.Race.Human, [], load("res://src/game/people/people_human_3.png")))
	persons.append(Build(4, "Human 4", Enums.Race.Human, [], load("res://src/game/people/people_human_4.png")))
	persons.append(Build(5, "Alien 1", Enums.Race.Alien, [], load("res://src/game/people/people_alien_1.png")))
	persons.append(Build(6, "Alien 2", Enums.Race.Alien, [], load("res://src/game/people/people_alien_2.png")))
	persons.append(Build(7, "Alien 3", Enums.Race.Alien, [traitBuilder.build_trait("Power Hog", "", Enums.TraitTypes.NEED, Enums.ShipResources.POWER, -15)], load("res://src/game/people/people_alien_3.png")))
	persons.append(Build(8, "Robot 1", Enums.Race.Robot, [], load("res://src/game/people/people_robot_1.png")))
	persons.append(Build(9, "Robot 2", Enums.Race.Robot, [], load("res://src/game/people/people_robot_1.png")))

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
