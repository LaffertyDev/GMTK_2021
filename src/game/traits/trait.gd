class_name Trait

const Enums = preload("res://src/game/enums.gd")

var title: String # title rendered to the user of this trait
var description: String # description rendered to the user of this trait
var resource_affected: int # resource enum, if -1 then this does not affect anything and is a permanent trait
var generative_effect: int # the delta in generated resources that this trait will have if the resource affected is being generated
var trait_type: int # the type of trait this is