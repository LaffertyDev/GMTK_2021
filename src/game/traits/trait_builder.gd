class_name TraitBuilder

const Enums = preload("res://src/game/enums.gd")
const Trait = preload("res://src/game/traits/trait.gd")

static func build_trait() -> Trait:
    var trait = Trait.new()
    trait.id = 0
    trait.title = ""
    trait.description = ""
    trait.individual = true
    trait.resource_affected = Enums.ShipResources.WATER
    trait.generative_effect = 1
    return trait