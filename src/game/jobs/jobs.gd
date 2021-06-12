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
		var job_assignment_string = person.name
		var resources_affected = _get_resources_affected_by_job(Job_Type)
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
		var job_unassignment_string = person.name
		var resources_affected = _get_resources_affected_by_job(Job_Type)
		for resource_affected in resources_affected:
			var individual_affect = -(person.get_individual_resource_effect(resource_affected)) # negative because its opposite because we're removing the person
			job_unassignment_string += " " + Enums.ShipResources.keys()[resource_affected] + " " + str(individual_affect)
		job_unassignment_popup.add_item(job_unassignment_string, person.id)

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

# Returns an array of resource types and how much they should be adjusted by
func adjust_resources(resourceManager: ResourceManager) -> void:
	var affected_resources = _get_resources_affected_by_job(Job_Type)
	for person in assigned_persons:
		for affected_resource in affected_resources:
			var individual_effect = person.get_individual_resource_effect(affected_resource)
			match(affected_resource):
				# code smell... need to link the Resources with the actual Resource in the Resource Manager
				(Enums.ShipResources.POWER):
					resourceManager.alien_power_delta += individual_effect
				(Enums.ShipResources.FOOD):
					resourceManager.human_food_delta += individual_effect
				(Enums.ShipResources.STRESS):
					if person.race == Enums.Race.Human:
						resourceManager.human_stress_delta += individual_effect
					if person.race == Enums.Race.Alien:
						resourceManager.alien_stress_delta += individual_effect
				(Enums.ShipResources.WATER):
					resourceManager.human_water_delta += individual_effect
				(Enums.ShipResources.MGUFFIN):
					resourceManager.alien_mguffin_delta += individual_effect
				_:
					print("UNKNOWN RESOURCE")
