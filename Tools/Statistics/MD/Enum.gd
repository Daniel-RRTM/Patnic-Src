extends Node
class_name Statistics_enum_MD






static func calc():
	var mdWriter = MarkdownWriter.new()
	

	for name in ENUM.allEnumsToString:
		var content = ENUM.allEnums[name]


		if ["RARITY_TO_STRING","PROGRESS_COLOR","ENTROPY_TO_STRING"].has(name):  writeList(name, content.values(), mdWriter)
		
		elif content is String     :   writeString(name, content, mdWriter)
		elif content is int        :   writeString(name, str(content), mdWriter)
		elif content is Vector2    :   writeVector(name, content, mdWriter)
		elif content is Dictionary :   writeList(name, content.keys(), mdWriter)

	
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/docs/conventions/Enums.md")




	


static func writeVector(name,content,mdWriter):
	mdWriter.add_header(name,3)	
	var vectorToString  = "X: " + str(content.x)+" "
	vectorToString     += "Y: " + str(content.y)
	writeString(name,vectorToString,mdWriter)

	

static func writeString(name,content,mdWriter):
	mdWriter.add_header(name,3)
	mdWriter.add_content_new_line(content)
 


static func writeList(name,content,mdWriter, i=0):
	mdWriter.add_header(name,3)
	for line in content:  mdWriter.add_content_new_line(str(i)+".  "+line); i+=0



static func writeListComp(list,name,mdWriter):
	mdWriter.add_header(name,3)
	for i in list.size():
		mdWriter.add_content_new_line(str(i)+". "+str(list[i].name))


