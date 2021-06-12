const Enums = preload("res://src/game/enums.gd")

class PersonManager:
	var persons = []

	func _init():
		persons.append(Person.Build(1, "Human 1", Enums.Race.Human))
		persons.append(Person.Build(2, "Human 2", Enums.Race.Human))
		persons.append(Person.Build(3, "Human 3", Enums.Race.Human))
		persons.append(Person.Build(4, "Human 4", Enums.Race.Human))
		persons.append(Person.Build(5, "Human 5", Enums.Race.Human))
		persons.append(Person.Build(6, "Alien 1", Enums.Race.Alien))
		persons.append(Person.Build(7, "Robot 1", Enums.Race.Robot))

	func get_person_by_id(id: int) -> Person:
		for person in persons:
			if (person.id == id):
				return person
		
		return null

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

class Person:
	var id: int
	var name: String
	var assignment: int
	var race: int

	static func Build(_id: int, _name: String, _race: int) -> Person:
		var person = Person.new()
		person.id = _id
		person.name = _name
		person.assignment = -1
		person.race = _race
		return person
