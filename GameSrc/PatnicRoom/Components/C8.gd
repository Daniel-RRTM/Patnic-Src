extends Component
class_name C_8_LEC_META

var value: Dictionary

func _init(valuePara:Dictionary):
	self.name = "C_8_LEC_META"
	value = valuePara



static func getType_quack(): return "STRING"


static func getAutoDoc(): return{
	"suggestion"  : "*tilesetname*_*rownumber*_*collumnumber* of its picture in folder : GameData/Tiled/Tileset",
	"description" : "Name of the Texture to be shown",
	"validInputs" : API_001_Atlas.Tiles().getEntries().keys(),
	"validType"   : "STATIC_LIST",
	"nameToShow"  : "MetaData of LEC",
}
