class_name PairedTrait

const Person = preload("res://src/game/people/person.gd")

var id: int
var title: String
var description: String
var effect_description: String
var player_affected_1_id: int
var player_affected_2_id: int

func is_pair_for_people(person1: Person, person2: Person) -> bool:
    return (self.player_affected_1_id == person1.id && self.player_affected_2_id == person2.id) || (self.player_affected_2_id == person1.id && self.player_affected_1_id == person2.id)