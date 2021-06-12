class_name Trait

const Enums = preload("res://src/game/enums.gd")

var id: int # id will be used for special Traits (i.e. Fusion)
var title: String # title rendered to the user of this trait
var description: String # description rendered to the user of this trait
var individual: bool # if this is an individual trait that always applies, or if it is a multi trait
var resource_affected: int # resource enum
var generative_effect: int # the delta in generated resources that this trait will have if the resource affected is being generated
