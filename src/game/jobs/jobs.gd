extends Control

const JobTypes = preload("res://src/game/jobs/job_types.gd")
const Enums = preload("res://src/game/enums.gd")
const TraitManager = preload("res://src/game/traits/trait_manager.gd")

export(String) var Job_Title = "{{ Job Label }}"
export(JobTypes.JobTypes) var Job_Type = JobTypes.JobTypes.chart_stars
export(int) var Max_Occupancy = 1
export(Texture) var Job_Texture

signal job_assignment_changed()

func _ready() -> void:
	add_to_group("jobs")
	add_to_group("cyclables")
	$HBoxContainer/job_icon.texture = Job_Texture
	var job_assignment_res = load("res://src/game/jobs/job_assignment_slot.tscn")
	for _x in range(0, Max_Occupancy):
		var job_assignment = job_assignment_res.instance()
		job_assignment.job_type = Job_Type
		job_assignment.connect("job_assignment_changed", self, "_on_assignment_changed")
		$job_assignments/list.add_child(job_assignment)

	$HBoxContainer/job_label.set_text(Job_Title)

func _on_assignment_changed():
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var assigned_persons = personManager.get_persons_assigned_to(Job_Type)
	var pairedTraitManager = get_tree().get_nodes_in_group("game_root")[0].paired_trait_manager
	if (assigned_persons.size() == 2):
		var pairedTrait = pairedTraitManager.get_pair_effect(assigned_persons[0], assigned_persons[1])
		$paired_trait_display.set_paired_trait(pairedTrait)
		$paired_trait_display.popup_centered()
		$HBoxContainer/view_pair_effect_button.show()
	else:
		$HBoxContainer/view_pair_effect_button.hide()
		$paired_trait_display.set_paired_trait(null)
	emit_signal("job_assignment_changed")

func adjust_resources(resourceManager: ResourceManager) -> void:
	var affected_resources = TraitManager.get_resources_affected_by_job(Job_Type)
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var assigned_persons = personManager.get_persons_assigned_to(Job_Type)
	if assigned_persons.size() > 0:
		match(Job_Type):
			(JobTypes.JobTypes.chart_stars):
				resourceManager.alien_power_delta -= 15
			(JobTypes.JobTypes.generate_power):
				pass
			(JobTypes.JobTypes.generate_food):
				pass
			(JobTypes.JobTypes.reduce_stress):
				pass
			(JobTypes.JobTypes.reclaim_water):
				pass
			(JobTypes.JobTypes.find_beatles):
				pass		
	
	if ($paired_trait_display.paired_trait != null):
		$paired_trait_display.paired_trait.apply_pair_effect(resourceManager)

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
				(Enums.ShipResources.BEATLES):
					resourceManager.alien_beatles_delta += individual_effect
				_:
					print("UNKNOWN RESOURCE")

func _on_cycle():
	if (Job_Type == JobTypes.JobTypes.chart_stars):
		var resourceManager = get_tree().get_nodes_in_group("game_root")[0].resource_manager
		var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
		var assigned_persons = personManager.get_persons_assigned_to(Job_Type)
		print(assigned_persons.size())
		if (assigned_persons.size() > 0):
			resourceManager.stars_charted = min(resourceManager.stars_charted + 1, resourceManager.stars_charted_cap)
			print(resourceManager.stars_charted)

func _on_view_pair_effect_button_pressed():
	$paired_trait_display.popup_centered()
