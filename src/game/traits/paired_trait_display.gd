extends Control

const PairedTrait = preload("res://src/game/traits/paired_trait.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/title.set_text("Title")
	$VBoxContainer/description.set_text("Nothing to see here...")

func set_paired_trait(pairedTraitToSet: PairedTrait):
	$VBoxContainer/title.set_text(pairedTraitToSet.title)
	$VBoxContainer/description.set_text(pairedTraitToSet.description)