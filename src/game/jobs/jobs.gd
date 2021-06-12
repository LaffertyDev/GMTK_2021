extends Control

const JobTypes = preload("res://src/game/jobs/job_types.gd")
const Enums = preload("res://src/game/enums.gd")

export(String) var Job_Title = "{{ Job Label }}"
export(JobTypes.JobTypes) var Job_Type = JobTypes.JobTypes.chart_stars
export(int) var Max_Occupancy = 1

signal job_assignment_changed()

func _ready() -> void:
	add_to_group("jobs")
	var job_assignment_res = load("res://src/game/jobs/job_assignment_slot.tscn")
	for _x in range(0, Max_Occupancy):
		var job_assignment = job_assignment_res.instance()
		job_assignment.job_type = Job_Type
		job_assignment.connect("job_assignment_changed", self, "_on_assignment_changed")
		add_child_below_node($HBoxContainer, job_assignment)

	$HBoxContainer/job_label.set_text(Job_Title)

func _on_assignment_changed():
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

func adjust_resources(resourceManager: ResourceManager) -> void:
	var affected_resources = _get_resources_affected_by_job(Job_Type)
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var assigned_persons = personManager.get_persons_assigned_to(Job_Type)
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

	var pairedTraitManager = get_tree().get_nodes_in_group("game_root")[0].paired_trait_manager
	if (assigned_persons.size() == 2):
		var pairedTrait = pairedTraitManager.get_pair_effect(assigned_persons[0], assigned_persons[1])
		pairedTrait.apply_pair_effect(resourceManager)
		$paired_trait_display.set_paired_trait(pairedTrait)
		$paired_trait_display.show()
	else:
		$paired_trait_display.hide()
