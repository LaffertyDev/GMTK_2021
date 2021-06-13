class_name TraitManager

const JobTypes = preload("res://src/game/jobs/job_types.gd")
const Enums = preload("res://src/game/enums.gd")
const Person = preload("res://src/game/people/person.gd")

static func get_resources_affected_by_job(jobType: int) -> Array:
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

static func get_traits_description(person: Person, resources: Array, is_short: bool) -> String:
	if resources.size() == 0:
		return ""
	var res = "("
	var is_first = true
	for resource_affected in resources:
		if !is_first:
			res += ", "
		is_first = false
		var format_string
		if is_short:
			format_string = get_resource_format_short_name(resource_affected)
		else:
			format_string = get_resource_format_long_name(resource_affected)
		var individual_affect = person.get_individual_resource_effect(resource_affected)
		res += format_string % individual_affect
	res += ")"
	return res

static func get_resource_format_short_name(resource: int) -> String:
	match(resource):
		(Enums.ShipResources.WATER):
			return "%d Water"
		(Enums.ShipResources.FOOD):
			return "%d Food"
		(Enums.ShipResources.POWER):
			return "%d Power"
		(Enums.ShipResources.STRESS):
			return "%d Stress"
		(Enums.ShipResources.MGUFFIN):
			return "%d Mguffin"
	return "%d"

static func get_resource_format_long_name(resource: int) -> String:
	match(resource):
		(Enums.ShipResources.WATER):
			return "Reclaims %d Water per Cycle"
		(Enums.ShipResources.FOOD):
			return "Farms %d Food per Cycle"
		(Enums.ShipResources.POWER):
			return "Generates %d Power per Cycle"
		(Enums.ShipResources.STRESS):
			return "Relieves %d Stress per Cycle"
		(Enums.ShipResources.MGUFFIN):
			return "Generates %d Mguffin per Cycle"
	return "%d"