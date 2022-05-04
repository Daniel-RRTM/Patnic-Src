extends Node
class_name Alecandria_LecToEnt_Condition


static func run(structureType:String,fileContent:Array):
	var eventEnt    = ConditionEntity.new()
	
	parseMeta(fileContent,eventEnt)
	parseMain(fileContent,eventEnt)
	
	API_001_Atlas.Conditions().addEntity(eventEnt,"C_6_NAME")




static func parseMeta(fileContent,eventEnt):
	var meta     = Alecandria_Util_ArrayScoper.getMetaSection(fileContent)
	var metaDict = Alecandria_Util_SectionSplitter_Meta.run(meta)
	eventEnt.addComponent(C_72_LEC_META_USE.new(metaDict["USE"]))
	eventEnt.addComponent(C_12_ATLAS_INDEX.new(metaDict["INDEX"]))
	eventEnt.addComponent(C_6_NAME.new(metaDict["INDEX"]))
	eventEnt.addComponent(C_71_LEC_META_BY.new(metaDict["BY"]))




static func parseMain(fileContent,eventEnt):
	var effectIndex = SYNTAX.EVENT.EFFECTS
	var main        = Alecandria_Util_ArrayScoper.getMainSection(fileContent)
	var mainData    = Alecandria_LecToEnt_Event.getDictOfSectionString(main)
	
	
	for comp in mainData["DATA"]["COMP"]:
		for arrow in ["--->","-->","->"] : comp.erase(arrow)
		if "C_0_DESCRIPTION" in comp :
			comp.pop_front()
			var desc =  comp as PoolStringArray
			eventEnt.addComponent(C_0_DESCRIPTION.new(desc.join(" ")))
		else: eventEnt.addComponent(DemocrECS.getComponentClass(comp[0]).new(comp[1]))
	
	
	for effect in mainData["RUN"]["EFFECT"]:
		var effectName = effect[0]
		var sanPara    = _006_Condition_Saniticer.saniticeParameter(effect.duplicate()) 
		var isValid    = effectIndex[effectName].validateDict(sanPara)
		eventEnt.effects.append(effectIndex[effectName].getArrToDict(sanPara))
