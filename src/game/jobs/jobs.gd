extends Control

enum JobTypes {
	chart_stars = 0,
	power_engines = 1,
	generate_power = 2,
	generate_food = 3,
	reduce_stress = 4,
	reclaim_water = 5,
	mguffin = 6
}

export(String) var Job_Title = "{{ Job Label }}"
export(JobTypes) var Job_Type = JobTypes.chart_stars
export(int) var Max_Occupancy = 1
var current_occupancy = 0

signal job_assignment_changed()

func _ready() -> void:
	add_to_group("jobs")
	$job_label.set_text(Job_Title)
	$job_occupancy_max.set_text(str(Max_Occupancy))

func _on_assign_pressed() -> void:
	var job_assignment_popup = PopupMenu.new()
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var unassignedPersons = personManager.get_unassigned_persons()
	for person in unassignedPersons:
		job_assignment_popup.add_item(person.name, person.id)

	add_child(job_assignment_popup)
	job_assignment_popup.popup_centered()
	job_assignment_popup.connect('modal_closed', job_assignment_popup, 'queue_free')
	job_assignment_popup.connect('id_pressed', self, '_on_assignment_selected')

func _on_assignment_selected(id: int) -> void:
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var person = personManager.get_person_by_id(id)
	personManager.assign_person(person, Job_Type)
	current_occupancy += 1
	$job_occupancy.set_text(str(current_occupancy))
	emit_signal("job_assignment_changed")

	$unassign.show()
	if (current_occupancy == Max_Occupancy):
		$assign.hide()

func _on_unassign_pressed() -> void:
	var job_unassignment_popup = PopupMenu.new()
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var personsAssignedTo = personManager.get_persons_assigned_to(Job_Type)
	for person in personsAssignedTo:
		job_unassignment_popup.add_item(person.name, person.id)

	add_child(job_unassignment_popup)
	job_unassignment_popup.popup_centered()
	job_unassignment_popup.connect('modal_closed', job_unassignment_popup, 'queue_free')
	job_unassignment_popup.connect('id_pressed', self, '_on_unassign_selected')

func _on_unassign_selected(id: int) -> void:
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var person = personManager.get_person_by_id(id)
	personManager.unassign_person(person)
	current_occupancy -= 1
	$job_occupancy.set_text(str(current_occupancy))
	emit_signal("job_assignment_changed")

	$assign.show()
	if (current_occupancy == 0):
		$unassign.hide()
