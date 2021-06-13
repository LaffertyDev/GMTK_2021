extends Control


const Person = preload("res://src/game/people/person.gd")

var person: Person;

func _ready():
	$person_icon.texture = person.texture
	$person_title.set_text(person.name)
	var idx = 0
	for need in person.traits:
		$traits_list.add_item(need.title, null, false)
		$traits_list.set_item_tooltip(idx, need.description)
		idx += 1
