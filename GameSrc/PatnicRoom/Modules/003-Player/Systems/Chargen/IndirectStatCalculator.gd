extends Node
class_name _005_Character_IndirectStats


static func calculate(ent):
	getHealthpoints(ent)
	getCarriageCapacity(ent)
	getLimits(ent)



static func getHealthpoints(ent:PlayerEntity):
	var cache = 8+ent.stats.attributes().constitution()/3
	ent.addComponent(C_57_HITPOINTS.new(cache))


static func getCarriageCapacity(ent):
	var cache = ent.stats().attributes().strength() + (ent.stats().attributes().constitution() * 2)
	ent.addComponent(C_23_CARRIAGE.new(cache))



static func getLimits(ent):
	var cache = ent.stats().attributes()
	
	var physCache = (cache.strength()  + cache.reaction()  + (cache.constitution()*2) ) / 3
	var menCache  = (cache.intuition() + cache.willpower() + (cache.logic()*2)        ) / 3
	var socCache  = (cache.intuition() + cache.willpower() + (cache.charisma()*2)     ) / 3
	
	ent.addComponent(C_22_LIMITS.new(physCache,menCache,socCache))



