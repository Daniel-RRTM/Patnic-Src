extends Node
class_name _Alecandria_Designer_Integer



static func initialice(root) -> void:
	root.sideTed.text = root.DesignManager.currentRow.printDataType()+"\n\n----\n"





static func commitInput(root) -> void:
	var input = root.sideTed.text.split("\n")
	input.remove(0)
	var value

	for line in input:
		if line != "" :   value = line
	
	root.DesignManager.currentRow.value = value

	root.DesignManager.currentRow = null
	root.DesignManager.printCurrentRows(root)
	root.mainTed.grab_focus()
	root.mainTed.cursor_set_line(1)
