extends Node
# DOCS  > Docs\API\docs\Cogsmos\democrECS\Entity.md                            
# DOCS  > TO ADD                                                               
# BOOKMARK[epic=Entities] Core                                                 
class_name Entity


# ----- INITIALICE --------------------------------------------------------- ##


# VAR > INDEX_NAME : INSTANCE     
var templates  : Dictionary = {}
var components : Dictionary = {}
var conditions : Dictionary = {}

# REFACTOR : BOTH STRING INTO INT FOR PERFORMANCE 
# VAR > STRING OF THEIR ENUM      
var flags      : Array      = []
var properties : Array      = []


func _init() -> void : 
	DemocrECS.addEntity(self)



# ----- GETTER ------------------------------------------------------------- ##

#>>> Components <<<#


# FUNC > Gets instance! use [getCompValue] for its content      
func getComp(compName:String) -> Component:	
	return self.components[compName]

# FUNC > Check [compInst.getType_quack()] for type of return    
func getCompValue(compName:String): 
	return self.components[compName].value

# FUNC >                                                        
func hasComp(componentName:String) -> bool:
	return self.components.has(componentName)



#>>> Templates <<<#


# FUNC > Flyweight-pattern, Instances are shared globally!      
func getCompTemp(tempName:String, compName:String) -> Component:  
	return templates[tempName].components[compName]

# FUNC > Flyweight-pattern, Instances are shared globally!      
# FUNC > Check [compInst.getType_quack()] for type of return    
func getCompTempValue(tempName:String, compName:String):
	return getCompTemp(tempName,compName).value

# FUNC >                                                        
func hasTemplate(tempName:String) -> bool:
	return self.templates.has(tempName)

func getFlagTemp(tempName:String):
	return templates[tempName].flags


#>>> Other Validators <<<#


# FUNC > Adding is done by [API_006_Condition]                  
func hasCond(condName:String)  -> bool:   return conditions.has(condName)

# FUNC >                                                        
func hasFlag(flagName:String)  -> bool:   return flags.has(flagName)

# FUNC >                                                        
func hasProperty(propEnum:int) -> bool:   
	return properties.has(propEnum)




# ----- SETTER ------------------------------------------------------------- ##

#>>> Components <<<#


# FUNC > Has to be indexed children of Component                
func addComponent(compInstance:Component) -> void:
	components[compInstance.name] = compInstance
	compInstance.owner = self

# FUNC > will not [queue_free()] the Component!                 
func removeComponent(compName:String) -> void:
	if hasComp(compName):  components.erase(compName)	



#>>> Templates <<<#


# FUNC >                                                        
func addTemplate(templateName:String, ent:Entity) -> void:
	templates[templateName] = ent

# FUNC >                                                        
func removeTemplate(tempName:String) -> void:
	if hasTemplate(tempName):   templates.erase(tempName)



#>>> Flags <<<#


# FUNC >                                                        
func addFlag(flagName:String) -> void:
	flags.append(flagName)

# FUNC >                                                        
func removeFlag(flagName:String) -> void:
	flags.erase(flagName)



#>>> Properties <<<#


# FUNC >                                                        
func addProperty(propEnum:int) -> void:
	properties.append(propEnum)

# FUNC >                                                        
func removeProperty(propEnum:int) -> void:
	properties.erase(propEnum)



