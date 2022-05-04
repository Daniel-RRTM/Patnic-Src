extends Node
class_name _006_Condition_Attacher


static func run(ent, condName:String, duration:int, var level:int=0) -> void :
		if is_instance_valid(ent):
			var condTemp   = API_001_Atlas.Conditions().getEntries()[condName]
			var newCondEnt = ConditionEntity.new()
			
			ent.conditions[condName] = newCondEnt
			newCondEnt.components    = condTemp.components.duplicate(true)
			newCondEnt.affectedEnt   = ent
			newCondEnt.duration      = duration+1
			newCondEnt.effects       = condTemp.effects
			newCondEnt.level         = level
			
			ent.conditions[condName] = newCondEnt
			Signals.connect("Effect_Turn_Started",newCondEnt,"run")
			SokraTiles.getCondition().addLayerEntry(ent,condName,newCondEnt.texture())





