extends Object
class_name DemocrECTS_EntityManager


# ----- CONSTRUCTORS ----------------------------------------------------------- ##
 


# REFACTOR 
#>>> Dictionary ---> Entity <<<#
static func constructNewEntity(metaData:Dictionary, toParse:Dictionary) -> Entity:
	var entityAttributes = {
	"COMPONENTS"  : DemocrECS.getAllComponents(),
	"FLAGS"       : DemocrECS.getAllFlags(),
	"PROPERTIES"  : DemocrECS.getAllProperties(),
	"TEMPLATES"   : DemocrECS.getAllTemplates(),
}
	
	
	if !_hasMandatoryComponents(toParse.keys(),metaData): return null
	
	var entity = metaData["class"].new()
	for entry in toParse.keys():
		
		for attributeType in entityAttributes.keys():
			if entityAttributes[attributeType].has(entry):
				
				match attributeType:
					"COMPONENTS"  : entity.addComponent(DemocrECS.getComponentClass(entry).new( toParse[entry] ))
					"FLAGS"       : entity.addFlag(entry)
					"PROPERTIES"  : entity.addProperty(DemocrECS.getPropertyEnumNr(entry))
					"TEMPLATES"   : "N/A" # STUB 
					_: printerr("attribute type"+str(attributeType)+"not found")
				break
			
	
	return entity as Entity


#>>> Entity ---> Specific Entity <<<#
static func convertEntity(metaData:Dictionary, toParse:Entity) -> Entity:
	if !_hasMandatoryComponents(getFlagsAndCompsOfEnt(toParse), metaData): return null
	
	var specificEntity = metaData["class"].new()
	for entry in toParse.components.values() :   specificEntity.addComponent(entry)
	for entry in toParse.templates           :   specificEntity.addTemplate(entry)
	for entry in toParse.flags               :   specificEntity.addFlag(entry)
	for entry in toParse.properties          :   specificEntity.addProperty(entry)
		
	return specificEntity



# ----- HELPERS ---------------------------------------------------------------- ##


static func _hasMandatoryComponents(toCheck:Array, metaData:Dictionary) -> bool:
	for compToString in metaData["mandatoryComps"]: 
		if !toCheck.has(compToString): 
			printerr("not all mandatory Components in Dictionary for Parsing to Entity! Missing: "+compToString)
			return false
	return true


static func getFlagsAndCompsOfEnt(ent:Entity) -> Array:
	var mergedFlagsAndComps  = []
	mergedFlagsAndComps     += ent.components.keys()
	mergedFlagsAndComps     += ent.flags
	return mergedFlagsAndComps


