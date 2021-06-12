extends Control

const Person = preload("res://src/game/people/person.gd")
const Enums = preload("res://src/game/enums.gd")
const JobTypes = preload("res://src/game/jobs/job_types.gd")

signal job_assignment_changed()
var assigned_person: Person
var job_type: int

func _ready():
	$HBoxContainer/button_unassign.hide()
	$HBoxContainer/slot_icon.hide()
	$HBoxContainer/slot_name.hide()

func _on_button_assign_pressed():
	var job_assignment_popup = PopupMenu.new()
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var unassignedPersons = personManager.get_unassigned_persons()
	for person in unassignedPersons:
		var job_assignment_string = person.name
		var resources_affected = _get_resources_affected_by_job(job_type)
		for resource_affected in resources_affected:
			var individual_affect = person.get_individual_resource_effect(resource_affected)
			job_assignment_string += " " + Enums.ShipResources.keys()[resource_affected] + " " + str(individual_affect)
			job_assignment_popup.add_item(job_assignment_string, person.id)

	add_child(job_assignment_popup)
	job_assignment_popup.popup_centered()
	job_assignment_popup.connect('modal_closed', job_assignment_popup, 'queue_free')
	job_assignment_popup.connect('id_pressed', self, '_on_assignment_selected')

func _on_assignment_selected(id: int) -> void:
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var person = personManager.get_person_by_id(id)
	personManager.assign_person(person, job_type)
	assigned_person = person
	$HBoxContainer/button_assign.hide()
	$HBoxContainer/button_unassign.show()
	$HBoxContainer/slot_name.show()
	$HBoxContainer/slot_icon.show()
	$HBoxContainer/slot_name.set_text(assigned_person.name)
	emit_signal("job_assignment_changed")
		
func _on_button_unassign_pressed():
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	personManager.unassign_person(assigned_person)
	$HBoxContainer/button_assign.show()
	$HBoxContainer/button_unassign.hide()
	$HBoxContainer/slot_name.hide()
	$HBoxContainer/slot_icon.hide()
	emit_signal("job_assignment_changed")

func _get_resources_affected_by_job(jobType: int) -> Array:
	match(jobType):
		(JobTypes.JobTypes.invalid):
			return []
		(JobTypes.JobTypes.chart_stars):
			return []
		(JobTypes.JobTypes.generate_power):
			return [Enums.ShipResources.POWER]
		(JobTypes.JobTypes.generate_food):
			return [Enums.ShipResources.FOOD]
		(JobTypes.JobTypes.reduce_stress):
			return [Enums.ShipResources.STRESS]
		(JobTypes.JobTypes.reclaim_water):
			return [Enums.ShipResources.WATER]
		(JobTypes.JobTypes.mguffin):
			return [Enums.ShipResources.MGUFFIN]
		_:
			return []
	