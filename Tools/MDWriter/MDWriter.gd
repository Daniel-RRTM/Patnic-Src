extends Node
class_name MarkdownWriter

var currentTableCollumns      = 0
var currentNumeration         = 0
var nummerationDepth          = 0
var currentNummerationOfDepth = 0

var _stringOfMd               = "" 



# Simple Syntax
func add_content_new_line(content)  -> void:	_addRawContent(str(content) + str("\r\n") )
func add_content_same_line(content) -> void:	_addRawContent(content)

func add_linebreak()                -> void:	_addRawContent( str("\r\n") )
func add_header(content,size:int=3) -> void:	_add_header(content, size)

func add_bold(content)              -> void:	_addRawContent( str("**") + content + str("**") )
func add_boldln(content)            -> void:	_addRawContent( str("**") + content + str("** \r\n") )

func add_italic(content)            -> void:	_addRawContent( str("*")  + content + str("*")  )
func add_italicln(content)          -> void:	_addRawContent( str("*")  + content + str("* \r\n")  )

func clear()                        -> void:    _stringOfMd =""

# Table
func create_table(collumns)         -> void:	_create_table(collumns)
func add_row_table(collumns)        -> void:	_add_row_table(collumns)


# Template
func add_template_title(content:String) -> void:
	add_header(content,1); add_linebreak();add_linebreak();add_linebreak()


# Render
func writeData(filepath) -> void:
	var file = File.new()
	var err = file.open(filepath,file.WRITE)
	file.store_line(_stringOfMd)
	file.close()






func _addRawContent(content) -> void:
	_stringOfMd += str(content)



func _add_header(content:String,size:int) -> void:
	add_linebreak()
	add_linebreak()
	var toAdd = ""
	for i in range(0,size): toAdd += "#"
	_addRawContent(toAdd+" "+content+"\r\n")


func _create_table(collumns) -> void:
	currentTableCollumns = collumns.size()
	var separator = []
	for i in collumns.size():  separator.append(" -- ")
	add_row_table(collumns)
	add_row_table(separator)


func _add_row_table(collumns) -> void:
	if currentTableCollumns == collumns.size():
		var cachedStr = ""

		for entry in collumns:
			cachedStr +=str("|")
			cachedStr +=str(" "+str(entry)+" ")
			
		cachedStr += str("| \r\n")
		_stringOfMd += cachedStr
		
	else:  
		print("table not applyable: excpected"+str(currentTableCollumns)+" but got "+str(collumns.size()))




