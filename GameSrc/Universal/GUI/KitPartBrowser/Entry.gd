extends Node
class_name _KitpartBrowserEntry


var mType ; var part ; var category ; var kitset ; var scene


func _init(kitsetPara,scenePara) -> void:
	mType    = kitsetPara.mType()
	category = kitsetPara.catType()
	kitset   = kitsetPara
	scene = scenePara
	
	if str(kitsetPara.partType()) == "0": part = "BASE"
	if str(kitsetPara.partType()) == "1": part = "MOD"
	if str(kitsetPara.partType()) == "2": part = "APPENDIX"


