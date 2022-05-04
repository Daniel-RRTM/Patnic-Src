extends Node
class_name Statistics_Syntax_Event



static func calc(atlasPara,typePara,filepath):
	var mdWriter = MarkdownWriter.new()
	mdWriter.add_template_title("Event-Syntax")




	mdWriter.writeData(filepath)












