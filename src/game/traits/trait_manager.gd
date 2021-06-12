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

static func get_traits_description(person: Person, resources: Array) -> String:
	var res = ""
	for resource_affected in resources:
		var individual_affect = person.get_individual_resource_effect(resource_affected)
		res += Enums.ShipResources.keys()[resource_affected] + " " + str(individual_affect) + " "
	return res