extends Control


var toSell = {   "object":null , "mode":null   }

func _ready():
	API_009_Sound.buildSceneReference()
	Gameloop.scene.get_node("background").texture = Utils.rng().getBackground("rest")



func calcToSell(obj,mode) -> void:
	get_node("Selling").visible = true
	toSell["object"] = obj
	toSell["mode"] = mode
	
	match mode:
		"VALUABLE" : get_node("Selling").insert(valuable(obj))
		"KITPART"  : get_node("Selling").insert(kitPart(obj))


func sell(credits):
	API_008_CLI.processCmdRaw("add credits",[credits])
	
	if toSell["mode"] == "VALUABLE":
		API_003_Player.currentChar.getComp("C_50_VALUABLES").substract(toSell.object[0],toSell.object[1],toSell.object[2],1)
		get_node("Valuables").initialice()
		
	if toSell["mode"] == "KITPART":
		API_003_Player.currentChar.kitventory().kitparts().remove(toSell.object)
		get_node("kitpart_browser").loadKitparts(API_003_Player.currentChar.kitventory().kitparts().getAll())








func valuable(arr) -> Dictionary:
	var stocks = Utils.rng().getRandomNumber(0,100)
	return{
		"type"    : [arr[0],10],
		"subType" : [arr[1],0],
		"quality" : [arr[2],int(arr[2])*10],
		"stocks"  : [str(stocks),stepify(stocks/10,0.1)]
	}

func kitPart(kitpart) -> Dictionary:
	var stocks = Utils.rng().getRandomNumber(0,100)
	var arrType = ["KitPart",25]
	var arrSubType : Array
	match kitpart.partType():
		ENUM.KITS.PARTS.BASE : arrSubType = ["Core",75]
		ENUM.KITS.PARTS.MOD  : arrSubType = ["Upgrade",25]
		ENUM.KITS.PARTS.BASE : arrSubType = ["Auxillary",0]
	return{
		"type"    : arrType,
		"subType" : arrSubType,
		"quality" : [str(kitpart.rarity()),int(kitpart.rarity())*10],
		"stocks"  : [str(stocks),stepify(stocks/10,0.1)]
	}




