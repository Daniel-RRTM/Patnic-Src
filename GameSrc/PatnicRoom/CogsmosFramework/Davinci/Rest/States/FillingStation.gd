extends Node


static func fill(category: Dictionary, scene: Node2D):
	var currentKit: String

	
	
	var pre = "[color=white]"
	var post = "[/color]"
	
	scene.get_node("one/text").bbcode_text   = pre+category["names"][0]+post
	scene.get_node("two/text").bbcode_text   = pre+category["names"][1]+post
	scene.get_node("three/text").bbcode_text = pre+category["names"][2]+post
	
	setKitSymbol(category,scene)




static func setKitSymbol(category: Dictionary, scene: Node2D):
	var kitSymbol : TextureRect 
	var texture   : Texture     
	
	kitSymbol          = scene.get_node("one/texture")
	texture            = load( category["symbols"][0] )
	kitSymbol.texture  = texture
	
	kitSymbol          = scene.get_node("two/texture")
	texture            = load( category["symbols"][1] )
	kitSymbol.texture  = texture
	
	kitSymbol          = scene.get_node("three/texture")
	texture            = load( category["symbols"][2] )
	kitSymbol.texture  = texture



static func fillAllModulesForKits(node):
	var currentKit = saniticeCurrentKit(node.bbcode_text)
	lockNodeIntoSelect(node)
	var rootNode = node.get_node("../../..")
	
	var layer = getLayerDictionaryByKitCat(rootNode)
	var modules = getAllModulesByKitCat(currentKit,layer)
	insertModulesToTexts(rootNode,modules)
	
	var test=node.get_node("root_KitBase/Module Title/text")



static func lockNodeIntoSelect(node):
	node.bbcode_text ="[color=yellow]"+saniticeCurrentKit(node.bbcode_text)+"[/color]"



static func getAllModulesByKitCat(kitName,layer):
	return kitFilePaths[layer][kitName]



static func insertModulesToTexts(node,modules):
	node.get_node("root_KitBase/Module Title/text").bbcode_text=modules[0]
	
	node.get_node("root_KitMod/Module Title/text").bbcode_text=modules[1]
	node.get_node("root_KitAppend/Module Title/text").bbcode_text=modules[2]



func saniticeCurrentKit(string : String) -> String:
	return string.split("]")[1].split("[")[0]



func getLayerDictionaryByKitCat(node):
	var firstEntry = node.get_node("root_KitBase/one/text").bbcode_text
	firstEntry = saniticeCurrentKit(firstEntry)
	return kitFilePaths["layerIndex"][firstEntry]





