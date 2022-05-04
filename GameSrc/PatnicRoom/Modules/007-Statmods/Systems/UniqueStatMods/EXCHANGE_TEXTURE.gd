extends Object
class_name _007_003_EXCHANGE_TEXTURE


# ----- MAIN --------------------------------------------------------------------- ##


static func run(ent:Entity,performance:Array) -> void : 
	if ent.hasComp("C_58_ALTERNATIVE_TEXTURES"):
		var cache = ent.getCompValue("C_58_ALTERNATIVE_TEXTURES")
		SokraTiles.getLayerNode(ent.layer()).drawCell_quack(cache,ent.pos())



# ----- META --------------------------------------------------------------------- ##


func getValueToString_quack() -> String :  return "change to alternate Texture"
func getName_quack()          -> String :  return "EXCHANGE_TEXTURE"

static func getDoc():
	return {
		
		"toShort"          : "alter Texture",
		"keyword"          : "U_EXCHANGE_TEXTURE",
		"name"             : "exchange Texture",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Change Texture to C_58_ALTERNATIVE_TEXTURES",

		"inputModule"      : "BOOL"

	}


