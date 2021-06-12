extends Control

const PairedTrait = preload("res://src/game/traits/paired_trait.gd")

var paired_trait: PairedTrait

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("cyclables")
	$VBoxContainer/title.set_text("Title")
	$VBoxContainer/description.set_text("Nothing to see here...")

func set_paired_trait(pairedTraitToSet: PairedTrait):
	paired_trait = pairedTraitToSet
	if (paired_trait == null):
		hide()
		return
	
	show()
	$VBoxContainer/title.set_text(paired_trait.title)
	$VBoxContainer/description.set_text(paired_trait.description)

func _on_cycle():
	if (paired_trait != null):
		paired_trait.apply_pair_effect_on_cycle()