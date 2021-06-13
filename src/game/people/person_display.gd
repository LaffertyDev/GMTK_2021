extends Control


const Person = preload("res://src/game/people/person.gd")

var person: Person;

func _ready():
	$person_icon.texture = person.texture
	$person_title.set_text(person.name)
	for need in person.get_needs():
		$traits_list.add_item(need.title)
