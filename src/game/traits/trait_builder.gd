class_name TraitBuilder

const Enums = preload("res://src/game/enums.gd")
const Trait = preload("res://src/game/traits/trait.gd")


static func build_trait(_title: String, _description: String, _trait_type: int, _resource_affected: int, _generative_effect: int) -> Trait:
    var trait = Trait.new()
    trait.title = _title
    trait.description = _description
    trait.resource_affected = _resource_affected
    trait.generative_effect = _generative_effect
    trait.trait_type = _trait_type
    return trait