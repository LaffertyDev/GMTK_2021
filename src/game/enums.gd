enum Race {
	Human = 0,
	Alien = 1,
	Robot = 2
}

enum ShipResources {
	WATER, # human shared with ship
	FOOD, # human unique
	POWER, # alien shared with ship
	STRESS, # human shared with alien
	BEATLES # alien unique
}

enum TraitTypes {
    NEED, # always on
    GENERATIVE_EFFECT # when they generate this resource
}