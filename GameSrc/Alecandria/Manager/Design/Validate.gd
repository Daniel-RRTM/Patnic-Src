extends Node
class_name _TextToolBox_PairingValidator




static func validateDesign(root):
	var allInputs = root.compInput
	var invalid = []
	
	for row in allInputs.values():
		root.mainTed.add_keyword_color(row.nameToShow,"#00bf53")
		var isInvalid = false
		
		
		if str(row.value).empty()                                               : isInvalid = true
		#if !row.validInput.has(row.value.to_upper() and !row.validInput.empty()): isInvalid = true
		if row.validType == "STRING"  and typeof(row.value) != TYPE_STRING      : isInvalid = true
		if row.validType == "INTEGER" and typeof(row.value) != TYPE_INT         : isInvalid = true
		
		
		if isInvalid: invalid.append(row)
	
	
	for row in invalid : root.mainTed.add_keyword_color(row.nameToShow,"#ff0073")
	
	if invalid.empty():_TextToolBox_PairingParser.parseRowData(root)






