extends PopupPanel

const PairedTrait = preload("res://src/game/traits/paired_trait.gd")

var paired_trait: PairedTrait

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("cyclables")
	$Control/MarginContainer/VBoxContainer/title.set_text("Title")
	$Control/MarginContainer/VBoxContainer/description.set_text("Nothing to see here...")
	$Control/MarginContainer/VBoxContainer/effect.set_text("I do nothing")

func set_paired_trait(pairedTraitToSet: PairedTrait):
	paired_trait = pairedTraitToSet
	if (paired_trait == null):
		hide()
		return
	
	show()
	$Control/MarginContainer/VBoxContainer/title.set_text(paired_trait.title)
	$Control/MarginContainer/VBoxContainer/description.set_text(paired_trait.description)
	$Control/MarginContainer/VBoxContainer/effect.set_text(paired_trait.effect_description)

func _on_cycle():
	if (paired_trait != null):
		var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
		paired_trait.apply_pair_effect_on_cycle(personManager)
