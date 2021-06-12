extends Control

const JobTypes = preload("res://src/game/jobs/job_types.gd")
const Enums = preload("res://src/game/enums.gd")

export(String) var Job_Title = "{{ Job Label }}"
export(JobTypes.JobTypes) var Job_Type = JobTypes.JobTypes.chart_stars
export(int) var Max_Occupancy = 1
var current_occupancy = 0
var assigned_persons = []

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
	assigned_persons.append(person)
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
	for x in range(0, assigned_persons.size()):
		if (assigned_persons[x].id == person.id):
			assigned_persons.remove(x)
			return

	personManager.unassign_person(person)
	current_occupancy -= 1
	$job_occupancy.set_text(str(current_occupancy))
	emit_signal("job_assignment_changed")

	$assign.show()
	if (current_occupancy == 0):
		$unassign.hide()

# Returns an array of resource types and how much they should be adjusted by
func adjust_resources(resourceManager: ResourceManager) -> void:
	for person in assigned_persons:
		match(Job_Type):
			(JobTypes.JobTypes.invalid):
				pass
			(JobTypes.JobTypes.chart_stars):
				pass
			(JobTypes.JobTypes.generate_power):
				resourceManager.alien_power_delta += 10
			(JobTypes.JobTypes.generate_food):
				resourceManager.human_food_delta += 10
			(JobTypes.JobTypes.reduce_stress):
				if person.race == Enums.Race.Human:
					resourceManager.human_stress_delta += 10
				if person.race == Enums.Race.Alien:
					resourceManager.alien_stress_delta += 10
			(JobTypes.JobTypes.reclaim_water):
				resourceManager.human_water_delta += 10
			(JobTypes.JobTypes.mguffin):
				resourceManager.alien_mguffin_delta += 10
			_:
				print("UNKNOWN JOB TYPE")
				print(person.name)
				print(person.assignment)
