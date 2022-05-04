extends Node
class_name _TextToolBox_PairingParser


static func parseRowData(root):
	var fileOfForm = _TextToolBox_Input.getJSONFormByEnum(root.CURRENT_FORM)
	var form       = Utils.json().fileToDictionary("res://GameData/Alecandria/Forms/"+fileOfForm)
	var allInputs  = root.compInput
	
	var ent = Entity.new()
	
	var allComps = DemocrECS.getAllComponents()

	for row in allInputs.values():   
		ent.addComponent(allComps[row.compToString].new(row.value))
	
	for flag in form["flags to add"]:
		ent.addFlag(flag)
	
	for i in form["mirrored values"].size() :
		var copy  = form["mirrored values"].keys()[i]
		var paste = form["mirrored values"].values()[i]
		ent.addComponent(allComps[paste].new(ent.getCompValue(copy)))
	
	for i in form["static values"].size() :
		var comp  = form["mirrored values"].keys()[i]
		var value = form["mirrored values"].values()[i]
		ent.addComponent(allComps[comp].new(ent.getCompValue(value)))
	
	for i in form["dynamic values"].size() :
		var comp  = form["mirrored values"].keys()[i]
		var value = form["mirrored values"].values()[i]
	
	
	ent.addComponent(C_12_ATLAS_INDEX.new(ent.getCompValue("C_6_NAME").to_upper()))
	ent.addComponent(C_72_LEC_META_USE.new(getUseTyp(root.CURRENT_FORM)))
	ent.addComponent(C_71_LEC_META_BY.new("PERSONAL"))
	
	
	var fileName = form["filename prefix"] + ent.getCompValue("C_6_NAME").to_upper()
	var fileContent = Alecandria.getEntToLec(ent)
	
	
	
	var file = File.new()
	file.open("res://GameData/Game elements/Personal/"+fileName+".lec", File.WRITE)
	file.store_string(Alecandria.getEntToLec(ent))
	file.close()
	
	print()




static func getUseTyp(formEnum)->int:
	match formEnum:
		_TextToolBox_Enum.FORMS.CONSUMABLE : return ENUM.LEC.TYPES.CONSUMABLES
		_TextToolBox_Enum.FORMS.SPECIALTY  : return ENUM.LEC.TYPES.ACTOR_SPECIALTY
		_TextToolBox_Enum.FORMS.EVENT      : return ENUM.LEC.TYPES.EVENT
		_TextToolBox_Enum.FORMS.BASE       : return ENUM.LEC.TYPES.KITPART_BASE
		_TextToolBox_Enum.FORMS.RACE       : return ENUM.LEC.TYPES.ACTOR_RACE
		_TextToolBox_Enum.FORMS.ROLE       : return ENUM.LEC.TYPES.ACTOR_ROLE
		_TextToolBox_Enum.FORMS.MOD        : return ENUM.LEC.TYPES.KITPART_MOD
		_:return 0





