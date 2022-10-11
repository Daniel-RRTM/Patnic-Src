extends OptionButton

var selectableOptions = {  "PERFORMANCE_ENHANCING_DRUGS" : [   "AMPHETAMINES" , "BARBITUATES" , "OPIOTS"     ]
						  ,"PRE_CRASH_DATA"              : [   "SCIENCE"      , "CULTURE"     , "HERMETIC"   ]
						  ,"REAGENTS"                    : [   "SHAMANIC"     , "CHAOTIC"     , "HERMETIC"   ] }





func _ready() -> void:  _on_type_selected(0)
func _on_type_selected(itemIndex:int):
	if itemIndex == 0:
		clear()
		add_item("")
	if itemIndex != 0:
		for subType in selectableOptions.values()[itemIndex-1]:
			add_item(subType)



func getAttribute()      -> String : return "subType"
func getSelectionText()  -> String : return get_item_text(selected)
