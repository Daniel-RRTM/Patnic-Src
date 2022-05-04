extends Component
class_name _005_Common_Kitventory


# ----- INITIALICE ----------------------------------------------------------- ##


var playerEntity 
var kitparts     : Kitparts
var kitsets      : Kitsets


func initialice(playerEntityPara):
	playerEntity  = playerEntityPara
	kitparts      = Kitparts.new(playerEntityPara)
	kitsets       = Kitsets.new(playerEntityPara)



# ----- GETTER --------------------------------------------------------------- ##


func kitparts() -> Kitparts : return kitparts
func kitsets()  -> Kitsets  : return kitsets



# ----- KITPARTS ------------------------------------------------------------- ##


class Kitparts:
	var cacheKitpart
	func _init(cachePara) -> void: cacheKitpart = cachePara.getComp("C_68_KITVENTORY")
	
	func getAll()               -> Array        :      	return cacheKitpart.listOfKits.values()
	func getByNr(nr)  		    -> KitSetEntity : 		return cacheKitpart.getKitSetByLevel(nr)
	func getByName(string)      -> KitSetEntity : 		return cacheKitpart.getKitSetByString(string)

	func remove(kitset)  	    -> void         : 		cacheKitpart.removeKitset(kitset)
	func append(kitset)         -> void         : 		cacheKitpart.addKitSet(kitset)



# ----- KITPARTS ------------------------------------------------------------- ##


class Kitsets:
	var cacheKitset
	func _init(cachePara) -> void: 
		cacheKitset = cachePara.getComp("C_51_PLAYER_KITSETS")

	func getAll()               -> Array        :      	return cacheKitset.listOfKits.values()
	func getByNr(nr)  			-> KitSetEntity : 		return cacheKitset.getKitSetByNr(nr)
	func getByName(string)  	-> KitSetEntity : 		return cacheKitset.getKitSetByString(string)

	func remove(kitset)         -> void         : 		cacheKitset.remove(kitset)
	func append(kitset)         -> void         : 		cacheKitset.addKitSet(kitset)


