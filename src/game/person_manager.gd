class_name PersonManager

const Enums = preload("res://src/game/enums.gd")
const Person = preload("res://src/game/person.gd")

var persons = []

func _init():
	persons.append(Build(1, "Human 1", Enums.Race.Human))
	persons.append(Build(2, "Human 2", Enums.Race.Human))
	persons.append(Build(3, "Human 3", Enums.Race.Human))
	persons.append(Build(4, "Human 4", Enums.Race.Human))
	persons.append(Build(6, "Alien 1", Enums.Race.Alien))
	persons.append(Build(6, "Alien 2", Enums.Race.Alien))
	persons.append(Build(7, "Robot 1", Enums.Race.Robot))
	persons.append(Build(8, "Robot 2", Enums.Race.Robot))

func get_person_by_id(id: int) -> Person:
	for person in persons:
		if (person.id == id):
			return person
	
	return null

static func Build(_id: int, _name: String, _race: int) -> Person:
	var person = Person.new()
	person.id = _id
	person.name = _name
	person.assignment = -1
	person.race = _race
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
