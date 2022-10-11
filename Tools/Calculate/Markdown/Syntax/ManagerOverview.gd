extends Node
class_name _Syntax_Parser_Overview


static func parse(systemName:String):
	var mdWriter = MarkdownWriter.new()
	var considerationManager = Chomsky.getSystemManager(systemName)
	var doc = considerationManager.getAutoDoc()
	
	mdWriter.add_template_title(doc.name)
	mdWriter.add_content_new_line(doc.description)
	
	mdWriter.add_linebreak()
	mdWriter.add_boldln("Context:")
	mdWriter.create_table(["keyword","meaning"])
	for context in doc.context: mdWriter.add_row_table([context.keyword,context.explanation])
	
	var counter = 1
	mdWriter.add_linebreak()
	mdWriter.add_boldln("Possible Operations:")
	for operation in considerationManager.operations.keys():
		mdWriter.add_content_new_line(str(counter)+". ["+operation+"]("+systemName+"/"+operation+".md"+")")
		counter += 1
	
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/Syntax/"+systemName+"Overview.md")
	
	
	
	mdWriter.clear()
	for consideration in considerationManager.operations.values():
		doc = consideration.getAutoDoc()
		mdWriter.add_template_title(doc.name)
		mdWriter.add_content_new_line(doc.description)

		mdWriter.add_linebreak()
		mdWriter.add_boldln("Parameter:")
		mdWriter.create_table(["Parameter","meaning"])
		
		for para in doc.parameter.keys():
			var left = "["+para+"]("+doc.parameter[para].link+")]" if !doc.parameter[para].link.empty() else para
			var right = doc.parameter[para].explanation
			mdWriter.add_row_table(["keyword","meaning"])
	
	
	
	
	
	
	
	
	
