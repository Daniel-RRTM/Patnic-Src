extends Node
class_name _TextToolBox_Browser_List







static func validateEntry(entry:Dictionary, filter:Dictionary) -> bool:
	var ent = entry["ENTITY"].mainSection
	
	for filterOption in filter.keys():
		if !filter[filterOption].empty():
			
			var compName = _TextToolBox_Lists_Filter.getCompOfFilter()[filterOption]
			
			var allOptions = filter[filterOption].split("AND") as Array
			for option in allOptions:
				
				for comp in ent["COMPONENTS"]:
					if comp[0] == compName:
						if comp[1] == option.replace(" ","") : 
							return true
	
	
	return false





