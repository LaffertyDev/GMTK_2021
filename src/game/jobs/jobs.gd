extends Control

enum JobTypes {
	chart_stars = 0,
	power_engines = 1,
	generate_power = 2,
	generate_food = 3,
	reduce_stress = 4,
	reclaim_water = 5
}

export(String) var Job_Title = "{{ Job Label }}"
export(JobTypes) var Job_Type = JobTypes.chart_stars
export(int) var Max_Occupancy = 1
var current_occupancy = 0

signal decrement_job(job_type)
signal increment_job(job_type)

func _ready() -> void:
	$job_label.set_text(Job_Title)
	$job_occupancy_max.set_text(str(Max_Occupancy))
	pass

func _on_minus_pressed() -> void:
	if (current_occupancy > 0):
		current_occupancy -= 1
		emit_signal("decrement_job", Job_Type)
	$plus.disabled = false
	$job_occupancy.set_text(str(current_occupancy))

func _on_plus_pressed() -> void:
	if (current_occupancy + 1 <= Max_Occupancy):
		current_occupancy += 1
		emit_signal("increment_job", Job_Type)
	if (current_occupancy == Max_Occupancy):
		$plus.disabled = true
	$job_occupancy.set_text(str(current_occupancy))
